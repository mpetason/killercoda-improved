# Step 1 — Understanding vCluster vs Host CRD Isolation

Before we begin installing CRDs, let's understand how vCluster provides isolation for CRDs.

CRDs in Kubernetes are cluster-scoped, meaning they're shared across all namespaces in a cluster. However, vCluster creates a new API server that can be configured with different CRD versions or even completely different CRDs.

Let's first look at what CRDs exist in the host cluster:

`kubectl get crds`{{exec}}

Now let's create a vCluster to see how it starts with no CRDs by default:

`vcluster create my-vcluster --namespace team-x`{{exec}}

## Why This Matters

This demonstrates a key concept of vCluster:
- The host cluster has a set of CRDs installed
- Each vCluster starts with a clean slate (no CRDs by default)
- vCluster can install its own CRDs without affecting the host cluster
- This isolation prevents CRD conflicts between tenants
- Each vCluster can have its own CRD version or completely different CRDs

This is a fundamental benefit of vCluster - true control plane isolation.