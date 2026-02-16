# Setting up vCluster with Network Policies

In this step, we'll create a vCluster and examine its default networking configuration.

First, let's check that we have the vCluster CLI installed:

```bash
vcluster --version
```

If the command fails, please install vCluster CLI by following the instructions in the previous scenario.

Next, let's create a basic vCluster configuration for our network policies lab:

```bash
mkdir -p ~/vcluster-network-policies
cd ~/vcluster-network-policies
```

Let's create a simple vCluster configuration file:

```yaml
# vcluster.yaml - Basic vCluster configuration for network policies
controlPlane:
  backingStore:
    etcd:
      embedded:
        enabled: true

  ingress:
    enabled: true
    host: vcluster-k8s-api.example.com

sync:
  toHost:
    serviceAccounts:
      enabled: true

  fromHost:
    nodes:
      enabled: true
      clearImageStatus: true

exportKubeConfig:
  context: my-vcluster-context
  server: https://vcluster-k8s-api.example.com
  secret:
    name: my-vcluster-kubeconfig

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
```

Let's create this configuration file:

```bash
cat > vcluster.yaml << EOF
# vcluster.yaml - Basic vCluster configuration for network policies
controlPlane:
  backingStore:
    etcd:
      embedded:
        enabled: true

  ingress:
    enabled: true
    host: vcluster-k8s-api.example.com

sync:
  toHost:
    serviceAccounts:
      enabled: true

  fromHost:
    nodes:
      enabled: true
      clearImageStatus: true

exportKubeConfig:
  context: my-vcluster-context
  server: https://vcluster-k8s-api.example.com
  secret:
    name: my-vcluster-kubeconfig

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
EOF
```

This configuration enables network policies in the vCluster and sets up basic control plane settings.

Let's deploy the vCluster:
```bash
vcluster create my-vcluster --kube-config ~/.kube/config --namespace my-vcluster
```

Once deployed, let's connect to the vCluster:
```bash
vcluster connect my-vcluster --namespace my-vcluster
```

After connecting, let's verify we're in the correct context:
```bash
kubectl config current-context
```

You should see something like `my-vcluster-context`.