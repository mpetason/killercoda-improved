# Monitoring and Observability

Setting up proper monitoring and observability is essential for production vClusters. In this step, we'll explore how to monitor vCluster performance.

First, let's check what monitoring components are available in the vCluster:
`kubectl get pods -n team-x | grep -i monitor`{{exec}}

vCluster integrates well with standard Kubernetes monitoring tools. You can set up Prometheus metrics collection:

`kubectl apply -f https://raw.githubusercontent.com/loft-sh/vcluster/main/docs/monitoring/prometheus.yaml`{{exec}}

This command deploys a Prometheus configuration that can scrape metrics from vClusters.

Let's also look at the vCluster logs to understand what's happening:
`kubectl logs deployment/vcluster-my-perf-cluster -n team-x`{{exec}}

For more detailed logging, you can increase the verbosity:
`vcluster create my-verbose-cluster --namespace team-x --log-level debug`{{exec}}

Monitoring helps ensure that vClusters are performing well and allows you to identify potential issues before they become critical.