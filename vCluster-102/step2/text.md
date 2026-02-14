# Step 2 — Deploy same app name in both vClusters

In this step, we'll deploy the same application name (`my-app`) in each vCluster. This demonstrates how vCluster's isolation prevents naming conflicts between tenants.

Connect to the first vCluster and deploy:

`vcluster connect my-vcluster-a`{{exec}}

`kubectl create deployment my-app --image=nginx --replicas=1`{{exec}}

`kubectl expose deployment my-app --port=80 --target-port=80 --type=ClusterIP`{{exec}}

`vcluster disconnect`{{exec}}

Repeat the steps for the second vCluster:

`vcluster connect my-vcluster-b`{{exec}}

`kubectl create deployment my-app --image=nginx --replicas=1`{{exec}}

`kubectl expose deployment my-app --port=80 --target-port=80 --type=ClusterIP`{{exec}}

`vcluster disconnect`{{exec}}

## Why This Matters

This is the core of vCluster's multi-tenancy capability:
- Both vClusters have a deployment named `my-app`
- These deployments are completely isolated from each other
- Each vCluster maintains its own control plane with its own API server
- The same application name can be used in different vClusters without conflict
- This allows teams to use familiar naming conventions while maintaining complete isolation

This is a powerful feature that makes it easy to share a host cluster while maintaining tenant independence.