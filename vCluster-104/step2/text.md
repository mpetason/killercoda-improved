# Resource Allocation and Performance Tuning

In this step, we'll look at how to properly allocate resources to vClusters for optimal performance.

When creating a vCluster, you can specify resource requests and limits for the vCluster components:

`vcluster create my-perf-cluster --namespace team-x --cpu-request 500m --memory-request 1Gi --cpu-limit 1000m --memory-limit 2Gi`{{exec}}

This command sets:
- CPU request to 500 millicores
- Memory request to 1Gi
- CPU limit to 1000 millicores
- Memory limit to 2Gi

Let's check if the vCluster was created with the correct resource settings:
`kubectl get pods -n team-x`{{exec}}

We can also examine the vCluster's deployment configuration:
`kubectl describe deployment vcluster-my-perf-cluster -n team-x`{{exec}}

Resource allocation is crucial for ensuring that vClusters don't consume excessive resources from the host cluster while still providing good performance to tenants.