# Step 1 — Configure Advanced vCluster Settings

In this step, we'll configure advanced settings for our existing vCluster to optimize its behavior for production workloads.

First, let's check our current vCluster configuration:
`vcluster list`{{exec}}

We'll use the `--upgrade` flag to update our existing vCluster with advanced configuration options:
`vcluster create my-advanced-cluster --namespace team-x --connect=false --upgrade --cpu-request 500m --memory-request 1Gi --cpu-limit 1000m --memory-limit 2Gi`{{exec}}

This command updates our existing vCluster with:
- CPU request of 500 millicores
- Memory request of 1Gi
- CPU limit of 1000 millicores
- Memory limit of 2Gi

Let's verify the updated configuration:
`kubectl describe deployment vcluster-my-advanced-cluster -n team-x`{{exec}}

The `--upgrade` flag is crucial for updating existing vClusters without having to recreate them, which is essential for production environments where you want to maintain uptime while making configuration changes.