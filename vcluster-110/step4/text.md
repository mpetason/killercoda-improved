# Testing Monitoring and Observability

In this step, we'll test our monitoring and observability implementation.

Let's deploy our monitoring configurations to the vCluster:

```bash
# Apply the service monitor
kubectl apply -f service-monitor.yaml --kubeconfig kubeconfig.yaml

# Apply the prometheus rules
kubectl apply -f prometheus-rule.yaml --kubeconfig kubeconfig.yaml

# Apply the grafana dashboard
kubectl apply -f grafana-dashboard.yaml --kubeconfig kubeconfig.yaml
```

Now let's verify that our monitoring components are working:

```bash
# Check if monitoring components are running
kubectl get pods -n monitoring --kubeconfig kubeconfig.yaml

# Check if our application metrics are being scraped
kubectl get servicemonitor monitoring-test-app --kubeconfig kubeconfig.yaml

# Check Prometheus targets
kubectl get pods -l app=prometheus --kubeconfig kubeconfig.yaml

# Describe Prometheus to check configuration
kubectl describe pod -l app=prometheus --kubeconfig kubeconfig.yaml
```

Let's also test that we can access the Grafana dashboard:

```bash
# Port forward to access Grafana
kubectl port-forward svc/grafana -n monitoring 3000:80 --kubeconfig kubeconfig.yaml

# Check if Prometheus is scraping our application
kubectl get prometheusrule vcluster-alerts --kubeconfig kubeconfig.yaml
```

The monitoring integration should:
1. Automatically collect metrics from our vCluster and applications
2. Display metrics in Grafana dashboards
3. Trigger alerts when resource thresholds are exceeded
4. Provide comprehensive observability into cluster performance
5. Allow for easy troubleshooting and performance analysis