# Setting up vCluster with Istio Ambient Mode

In this step, we'll create a vCluster configuration that includes Istio ambient mode integration.

Let's examine the vCluster configuration with Istio ambient mode:

```yaml
# vcluster.yaml - vCluster configuration with Istio ambient mode

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
  # Istio integration with ambient mode
  istio:
    enabled: true
    version: "1.19.0"  # Specify Istio version
    ambient:
      enabled: true
    # Additional Istio configuration for ambient mode
    install:
      values:
        global:
          proxy:
            autoInject: enabled
        sidecarInjectorWebhook:
          injectLabel: istio-injected
        pilot:
          env:
            PILOT_ENABLE_CONFIG_DISTRIBUTION_TRACKING: "true"
            PILOT_ENABLE_XDS_LDS: "true"
            PILOT_ENABLE_XDS_NDS: "true"
        istiod:
          enableAnalysis: false
```

This configuration enables Istio ambient mode in the vCluster:
1. Sets up Istio with a specific version
2. Enables ambient mode for service mesh
3. Configures automatic proxy injection
4. Enables configuration distribution tracking
5. Sets up proper XDS configuration for ambient mode

Let's create this configuration file in our repository: