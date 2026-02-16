# Step 3 — Monitoring and Observability Setup

Setting up proper monitoring and observability is essential for production vCluster deployments. In this step, we'll explore how to monitor vCluster performance.

Let's first check what monitoring components are available in the vCluster:
`kubectl get pods -n team-x | grep -i monitor`{{exec}}

vCluster integrates well with standard Kubernetes monitoring tools. We can set up Prometheus metrics collection:
`kubectl apply -f https://raw.githubusercontent.com/loft-sh/vcluster/main/docs/monitoring/prometheus.yaml`{{exec}}

This command deploys a Prometheus configuration that can scrape metrics from vClusters.

Let's also look at the vCluster logs to understand what's happening:
`kubectl logs deployment/vcluster-my-advanced-cluster -n team-x`{{exec}}

For more detailed logging, we can increase the verbosity:
`vcluster create my-advanced-cluster --namespace team-x --connect=false --upgrade --log-level debug`{{exec}}

Monitoring helps ensure that vClusters are performing well and allows you to identify potential issues before they become critical.