# Shared Nodes

With Shared Nodes, all workloads from multiple virtual clusters run on the same underlying worker nodes. This is the default tenancy model.

![Shared Nodes](../assets/shared_nodes_killercoda.png)

## Benefits:

- Very cost-efficient
- Minimal complexity
- Perfect for dev, test, preview, and production

## Hands-On: Create a Shared Nodes vCluster

Let's create a vCluster using the default Shared Nodes model and deploy a workload:

`vcluster create shared-demo --namespace shared-ns`{{exec}}

Deploy a simple application:

`kubectl create deployment nginx --image=nginx`{{exec}}

`kubectl get pods`{{exec}}

Now disconnect and check where the pod is running on the host:

`vcluster disconnect`{{exec}}

`kubectl get pods -n shared-ns`{{exec}}

`kubectl get nodes`{{exec}}

Notice how the pod runs on the same node as all other workloads. This is the Shared Nodes model — simple and cost-efficient.

Clean up:

`vcluster delete shared-demo`{{exec}}
