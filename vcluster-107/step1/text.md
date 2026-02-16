# Setting up GitHub Actions Workflow

In this step, we'll create a basic GitHub Actions workflow that will manage vCluster lifecycle through pull requests.

First, let's examine the workflow file that we'll be creating:

```yaml
name: vCluster Management

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  vcluster-deploy:
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

      - name: Create vCluster for PR
        if: github.event_name == 'pull_request'
        run: |
          PR_NUMBER=${{ github.event.pull_request.number }}
          VCLUSTER_NAME="pr-${PR_NUMBER}"
          echo "Creating vCluster: $VCLUSTER_NAME"
          vcluster platform create $VCLUSTER_NAME --project preview --recreate

      - name: Deploy to vCluster
        run: |
          # Deploy your application to the vCluster
          # This would typically use kubectl or helm
          echo "Deploying application to vCluster"
          # Example: kubectl apply -f k8s/deployment.yaml --kubeconfig ./vcluster-kubeconfig

      - name: Cleanup vCluster
        if: github.event_name == 'pull_request'
        run: |
          PR_NUMBER=${{ github.event.pull_request.number }}
          VCLUSTER_NAME="pr-${PR_NUMBER}"
          echo "Cleaning up vCluster: $VCLUSTER_NAME"
          vcluster platform delete $VCLUSTER_NAME --project preview --delete-namespace
```

This workflow will:
1. Run on push to main branch and pull requests
2. Set up the vCluster CLI
3. Create a vCluster when a pull request is opened
4. Deploy applications to the vCluster
5. Clean up the vCluster when the pull request is closed

Let's create this workflow file in our repository: