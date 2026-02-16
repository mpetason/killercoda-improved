# Creating ArgoCD Integration Workflow

In this step, we'll create a more advanced workflow that integrates with ArgoCD for continuous deployment.

Let's examine the advanced workflow file:

```yaml
name: ArgoCD vCluster Deployment

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  deploy-to-vcluster:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Setup vCluster CLI
        uses: loft-sh/setup-loft@v2
        with:
          version: v3.0.0
          url: https://your-platform-url.com
          access-key: ${{ secrets.VCLUSTER_ACCESS_KEY }}

      - name: Setup ArgoCD CLI
        run: |
          curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
          sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
          rm argocd-linux-amd64

      - name: Create vCluster for PR
        if: github.event_name == 'pull_request'
        run: |
          PR_NUMBER=${{ github.event.pull_request.number }}
          VCLUSTER_NAME="pr-${PR_NUMBER}"
          echo "Creating vCluster: $VCLUSTER_NAME"
          vcluster platform create $VCLUSTER_NAME --project preview --recreate

          # Get kubeconfig for the vCluster
          vcluster connect $VCLUSTER_NAME --server `kubectl get svc -n vcluster-$VCLUSTER_NAME $VCLUSTER_NAME -o jsonpath='{.status.loadBalancer.ingress[0].ip}'` --print > kubeconfig.yaml

      - name: Deploy with ArgoCD
        if: github.event_name == 'push'
        run: |
          # Deploy using ArgoCD
          echo "Deploying to vCluster with ArgoCD"
          argocd login argocd.example.com --username admin --password ${{ secrets.ARGOCD_PASSWORD }}
          argocd app create my-app --repo https://github.com/your-org/your-repo.git --path k8s --dest-server https://kubernetes.default.svc --dest-namespace default
          argocd app sync my-app

      - name: Cleanup vCluster
        if: github.event_name == 'pull_request'
        run: |
          PR_NUMBER=${{ github.event.pull_request.number }}
          VCLUSTER_NAME="pr-${PR_NUMBER}"
          echo "Cleaning up vCluster: $VCLUSTER_NAME"
          vcluster platform delete $VCLUSTER_NAME --project preview --delete-namespace
```

This workflow:
1. Sets up both vCluster and ArgoCD CLI tools
2. Creates vClusters for pull requests
3. Deploys applications to vClusters using ArgoCD when pushing to main
4. Cleans up vClusters when pull requests are closed

Let's create this workflow file in our repository: