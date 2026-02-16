# Setting up vCluster with External Secrets Integration

In this step, we'll create a vCluster configuration that includes External Secrets Operator integration.

Let's examine the vCluster configuration with External Secrets:

```yaml
# vcluster.yaml - vCluster configuration with External Secrets integration

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
  # External Secrets Operator integration
  externalSecrets:
    enabled: true
    version: "0.9.0"  # Specify ESO version
    # Additional ESO configuration
    install:
      values:
        global:
          proxy:
            autoInject: enabled
        controller:
          resources:
            requests:
              cpu: "100m"
              memory: "128Mi"
            limits:
              cpu: "200m"
              memory: "256Mi"
```

This configuration enables External Secrets Operator in the vCluster:
1. Sets up ESO with a specific version
2. Configures proper resource limits for the controller
3. Enables automatic proxy injection
4. Integrates with the vCluster's control plane

Let's create this configuration file in our repository: