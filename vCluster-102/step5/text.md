# Step 5 — Cleanup & wrap-up

In this final step, we'll clean up the vClusters we created.

`vcluster delete my-vcluster-a`{{exec}}

`vcluster delete my-vcluster-b`{{exec}}

`kubectl delete namespace team-x`{{exec}}

`kubectl delete namespace team-y`{{exec}}

`vcluster list`{{exec}}

## Why This Matters

Cleaning up resources is an important part of any vCluster workflow:
- vClusters consume resources on the host cluster
- Proper cleanup prevents resource leakage
- It's good practice to clean up after testing
- The vCluster delete command removes all associated resources
- Namespace cleanup ensures a clean environment for future experiments

This demonstrates the complete lifecycle of vClusters - from creation to cleanup.