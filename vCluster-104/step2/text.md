# Step 2 — Resource Allocation and Performance Tuning

In this step, we'll dive deeper into resource allocation and performance tuning for vClusters.

Let's check the current resource usage of our vCluster:
`kubectl top pods -n team-x`{{exec}}

We can also examine the resource requests and limits more closely:
`kubectl get pods -n team-x -o yaml | grep -A 10 "resources"`{{exec}}

Now let's update our vCluster with more specific resource settings for better performance:
`vcluster create my-advanced-cluster --namespace team-x --connect=false --upgrade --cpu-request 750m --memory-request 2Gi --cpu-limit 1500m --memory-limit 4Gi`{{exec}}

These settings provide:
- Higher CPU request for better performance
- Increased memory request and limit
- More generous resource allocation for production workloads

Let's verify our updated resource settings:
`kubectl get deployment vcluster-my-advanced-cluster -n team-x -o yaml | grep -A 20 "resources"`{{exec}}

Proper resource allocation is crucial for ensuring that vClusters don't consume excessive resources from the host cluster while still providing good performance to tenants.