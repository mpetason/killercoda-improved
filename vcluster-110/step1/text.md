# Setting up vCluster with Monitoring Integration

In this step, we'll create a vCluster configuration that includes monitoring and observability integration.

Let's examine the vCluster configuration with monitoring:

```yaml
# vcluster.yaml - vCluster configuration with monitoring integration

# Control plane configuration
controlPlane:
  backingStore:
    etcd:
      embedded:
        enabled: true

  ingress:
    enabled: true
    host: vcluster-k8s-api.example.com

# Resource synchronization settings
sync:
  toHost:
    serviceAccounts:
      enabled: true

  fromHost:
    nodes:
      enabled: true
      clearImageStatus: true

# Kubeconfig export configuration
exportKubeConfig:
  context: my-vcluster-context
  server: https://vcluster-k8s-api.example.com
  secret:
    name: my-vcluster-kubeconfig

# Policies configuration
policies:
  resourceQuota:
    enabled: true
    quota:
      requests.cpu: "10"
      requests.memory: "20Gi"
      limits.cpu: "20"
      limits.memory: "40Gi"
      pods: "100"
      services: "50"

  limitRange:
    enabled: true
    default:
      cpu: "500m"
      memory: "512Mi"
    defaultRequest:
      cpu: "100m"
      memory: "128Mi"

  networkPolicy:
    enabled: true

# Integrations configuration
integrations:
  # Monitoring integration
  monitoring:
    enabled: true
    version: "2.37.0"  # Specify Prometheus version
    # Additional monitoring configuration
    install:
      values:
        global:
          proxy:
            autoInject: enabled
        prometheus:
          resources:
            requests:
              cpu: "200m"
              memory: "400Mi"
            limits:
              cpu: "500m"
              memory: "800Mi"
        grafana:
          resources:
            requests:
              cpu: "100m"
              memory: "128Mi"
            limits:
              cpu: "200m"
              memory: "256Mi"
        prometheusOperator:
          resources:
            requests:
              cpu: "100m"
              memory: "128Mi"
            limits:
              cpu: "200m"
              memory: "256Mi"
```

This configuration enables monitoring in the vCluster:
1. Sets up Prometheus with a specific version
2. Configures Grafana for visualization
3. Sets up proper resource limits for monitoring components
4. Enables automatic proxy injection
5. Integrates with the vCluster's control plane

Let's create this configuration file in our repository: