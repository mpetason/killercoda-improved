# Step 3 — Install Different CRD in vCluster

In this step, we'll install a different CRD in the vCluster to show how vCluster can have completely different CRDs than the host cluster.

`kubectl apply -f https://raw.githubusercontent.com/loft-sh/vcluster/main/examples/crd-example2.yaml`{{exec}}

`kubectl get crds`{{exec}}

Now we can see that the vCluster has both CRDs installed:
- `crontabs.stable.example.com` (from host)
- `myapp.example.com` (from vCluster)

Let's create a custom resource using the new CRD:

`kubectl create -f https://raw.githubusercontent.com/loft-sh/vcluster/main/examples/crd-example2.yaml`{{exec}}

`kubectl get myapp`{{exec}}

## Why This Matters

This demonstrates advanced vCluster capabilities:
- vCluster can install CRDs that don't exist in the host cluster
- vCluster can install different versions of CRDs
- Multiple CRDs can coexist in the same vCluster
- Custom resources can be created and managed independently
- This enables flexible tenancy models where each tenant can have their own CRD ecosystem

This level of flexibility is what makes vCluster powerful for enterprise Kubernetes deployments.

## Important Note

We've now demonstrated CRD isolation between the host and vCluster. In the next step, we'll disconnect from the vCluster to return to the host cluster context so we can continue with host cluster operations.