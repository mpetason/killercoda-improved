# Step 3 — Expose both apps (port-forward)

In this step, we'll port-forward each `my-app` service so they can be reached locally. This demonstrates how each vCluster's services are isolated and can be accessed independently.

`vcluster connect my-vcluster-a`{{exec}}

`kubectl port-forward svc/my-app 18080:80 &`{{exec}}

`vcluster disconnect`{{exec}}

`vcluster connect my-vcluster-b`{{exec}}

`kubectl port-forward svc/my-app 28080:80 &`{{exec}}

`vcluster disconnect`{{exec}}

## Why This Matters

Port-forwarding demonstrates the isolation of each vCluster:
- Each vCluster's `my-app` service is accessible on a different local port
- The same service name in different vClusters doesn't conflict
- Each vCluster maintains its own network namespace
- This pattern allows multiple tenants to access their applications independently
- It shows that each vCluster provides a complete, isolated Kubernetes networking environment

This capability is essential for testing and development workflows where multiple teams need to access their applications simultaneously.