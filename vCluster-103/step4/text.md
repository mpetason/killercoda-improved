# Step 4 — Compare CRD Versions

Let's examine the differences between CRDs in the host and vCluster:

`kubectl get crd crontabs.stable.example.com -o yaml`{{exec}}

`kubectl get crd myapp.example.com -o yaml`{{exec}}

Now let's disconnect from the vCluster to return to the host cluster context:

`vcluster disconnect`{{exec}}

`kubectl get crd crontabs.stable.example.com -o yaml`{{exec}}

## Why This Matters

This comparison shows the isolation capabilities:
- The host cluster has the `crontabs.stable.example.com` CRD
- The vCluster has both the host CRD and its own `myapp.example.com` CRD
- CRDs are completely isolated between environments
- This allows for different CRD versions or completely different CRDs per tenant
- The host cluster remains unchanged when vClusters install CRDs

This demonstrates how vCluster enables true control plane isolation at the CRD level, which is essential for managing complex multi-tenant Kubernetes deployments.

## Important Note

We've disconnected from the vCluster to ensure we're working in the host cluster context for the next steps. This is important because the following steps will install CRDs directly on the host cluster, and we want to make sure we're not inadvertently installing them in the vCluster.