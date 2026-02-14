# Step 2 — Install CRDs in Host Cluster

Now let's install a CRD in the host cluster to demonstrate the difference:

`kubectl apply -f https://raw.githubusercontent.com/loft-sh/vcluster/main/examples/crd-example.yaml`{{exec}}

`kubectl get crds`{{exec}}

We can see that the `crontabs.stable.example.com` CRD has been installed in the host cluster. This CRD is now available to all namespaces in the host cluster.

Let's check what CRDs are available in the vCluster:

`kubectl get crds`{{exec}}

Notice that the vCluster has no CRDs installed, which is the expected behavior since it starts with a clean slate.

## Why This Matters

This demonstrates the core isolation principle:
- Host cluster CRDs are shared across all namespaces
- vCluster CRDs are completely isolated from the host
- The vCluster can install CRDs that don't exist in the host
- This allows for different CRD versions or completely different CRDs per tenant
- This isolation prevents conflicts and enables flexible tenancy models

This capability is essential for complex Kubernetes environments where different teams need different CRD versions or custom resources.