# Configuring Monitoring and Alerting

In this step, we'll configure the monitoring and alerting for our vCluster.

Let's create a Prometheus ServiceMonitor to monitor our application:

```yaml
# service-monitor.yaml - Prometheus ServiceMonitor for application metrics
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: monitoring-test-app
spec:
  selector:
    matchLabels:
      app: monitoring-test-app
  endpoints:
  - port: http
    interval: 30s
    path: /metrics
```

And let's create a PrometheusRule for alerting:

```yaml
# prometheus-rule.yaml - Prometheus alerting rules
apiVersion: monitoring.coreos.com/v1
kind: PrometheusRule
metadata:
  name: vcluster-alerts
spec:
  groups:
  - name: vcluster.rules
    rules:
    - alert: HighCPUUsage
      expr: rate(container_cpu_usage_seconds_total{container!="POD",container!=""}[5m]) > 0.8
      for: 10m
      labels:
        severity: warning
      annotations:
        summary: "High CPU usage detected"
        description: "CPU usage is above 80% for more than 10 minutes"

    - alert: HighMemoryUsage
      expr: container_memory_usage_bytes{container!="POD",container!=""} > 1073741824
      for: 10m
      labels:
        severity: warning
      annotations:
        summary: "High memory usage detected"
        description: "Memory usage is above 1GB for more than 10 minutes"
```

Let's also create a Grafana dashboard configuration:

```yaml
# grafana-dashboard.yaml - Grafana dashboard configuration
apiVersion: v1
kind: ConfigMap
metadata:
  name: vcluster-dashboard
data:
  dashboard.json: |
    {
      "dashboard": {
        "id": null,
        "title": "vCluster Overview",
        "panels": [
          {
            "title": "CPU Usage",
            "type": "graph",
            "datasource": "Prometheus",
            "targets": [
              {
                "expr": "rate(container_cpu_usage_seconds_total{container!=\"POD\",container!=\"\"}[5m])",
                "legendFormat": "{{pod}}"
              }
            ]
          }
        ]
      }
    }
```

These configurations will:
1. Set up ServiceMonitor to scrape application metrics
2. Configure alerting rules for resource usage
3. Create a basic Grafana dashboard for vCluster monitoring
4. Enable proper metric collection and alerting