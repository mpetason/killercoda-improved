# Step 5 — Cleanup & Wrap-up

In this final step, we'll clean up the resources we created:

`vcluster delete my-vcluster`{{exec}}

`kubectl delete namespace team-x`{{exec}}

`vcluster list`{{exec}}

## Why This Matters

Proper cleanup is essential for vCluster management:
- vClusters consume host cluster resources
- Cleaning up prevents resource leakage
- It maintains a clean environment for future experiments
- The vCluster delete command removes all associated resources
- Namespace cleanup ensures proper isolation

This demonstrates the complete lifecycle of vCluster CRD management - from creation to cleanup while maintaining proper isolation between environments.