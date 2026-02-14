# Step 1 — Create two vClusters

In this step, we'll create two vClusters in separate namespaces. This demonstrates how vCluster enables multi-tenancy by providing isolated control planes for each tenant.

`kubectl create namespace team-x`{{exec}}

`vcluster create --connect=false my-vcluster-a --namespace team-x`{{exec}}

`kubectl create namespace team-y`{{exec}}

`vcluster create --connect=false my-vcluster-b --namespace team-y`{{exec}}

Verify both are running with `vcluster list`{{exec}}

## Why This Matters

Creating vClusters in separate namespaces is a common pattern for multi-tenancy:
- Each vCluster gets its own isolated control plane
- Namespaces provide logical separation at the host cluster level
- The `--connect=false` flag creates the vCluster without automatically connecting to it
- This allows you to manage multiple vClusters from the same host cluster

This pattern is essential for organizations that want to provide isolated Kubernetes environments to different teams or projects.