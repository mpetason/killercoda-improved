# Creating ArgoCD Application Definition

In this step, we'll create an ArgoCD Application definition that will deploy vCluster using Helm charts.

Let's examine the ArgoCD Application definition:

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: my-vcluster
  namespace: argocd
spec:
  project: default
  source:
    chart: vcluster
    repoURL: https://charts.loft.sh
    targetRevision: 0.31.0
    helm:
      releaseName: my-vcluster
      valueFiles:
        - vcluster.yaml
  destination:
    server: https://kubernetes.default.svc
    namespace: team-alpha
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      - CreateNamespace=true
```

This Application definition:
1. Uses the vCluster Helm chart from Loft.sh
2. References our vcluster.yaml configuration file
3. Deploys to the team-alpha namespace
4. Enables automated sync with pruning and self-healing
5. Creates the namespace if it doesn't exist

Let's create this file in our repository: