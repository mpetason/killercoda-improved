# Resource Limits and Requests

In production environments, you should set resource limits on the vCluster control plane to prevent it from consuming too many host cluster resources.

## Disconnect and Update Configuration

First, disconnect from the vCluster:

`vcluster disconnect`{{exec}}

Create an updated configuration with resource limits. Here's the YAML we'll use:

```yaml
sync:
  toHost:
    ingresses:
      enabled: true
  fromHost:
    nodes:
      enabled: true
controlPlane:
  statefulSet:
    resources:
      limits:
        cpu: "1"
        memory: "512Mi"
      requests:
        cpu: "200m"
        memory: "256Mi"
```

The `controlPlane.statefulSet.resources` section sets CPU and memory limits on the vCluster control plane pod, just like you would for any Kubernetes workload.

Click below to create this file:

`cat <<'EOF' > /root/vcluster-resources.yaml
sync:
  toHost:
    ingresses:
      enabled: true
  fromHost:
    nodes:
      enabled: true
controlPlane:
  statefulSet:
    resources:
      limits:
        cpu: "1"
        memory: "512Mi"
      requests:
        cpu: "200m"
        memory: "256Mi"
EOF`{{exec}}

## Apply the Updated Configuration

Use the `--upgrade` flag to update the existing vCluster:

`vcluster create config-demo --namespace config-ns --upgrade --values /root/vcluster-resources.yaml`{{exec}}

## Verify Resource Limits

Check the statefulset to confirm resource limits are applied:

`kubectl get statefulset -n config-ns -o jsonpath='{range .items[*]}{.metadata.name}{"\n"}{.spec.template.spec.containers[0].resources}{"\n"}{end}'`{{exec}}

You should see the CPU and memory limits we configured. Setting resource limits is a best practice for production vClusters to ensure fair resource sharing on the host cluster.
