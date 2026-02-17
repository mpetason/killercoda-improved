# Dedicated Nodes

Dedicated Nodes ensure Pods from a vCluster run **only** on specific nodes assigned to that vCluster.

This is accomplished with nodeSelectors, taints, and tolerations.

![Dedicated Nodes](../assets/dedicated_nodes_killercoda.png)

### Example vcluster.yaml:

```yaml
sync:
  nodes:
    enabled: true

scheduler:
  nodeSelector:
    dedicated: team-x
```

To use this configuration, you would label your nodes with `dedicated: team-x` and create the vCluster with:

```
vcluster create my-vcluster --namespace team-x --values vcluster.yaml
```

### Benefits:

- Strong workload separation
- Great for putting teams on nodes with GPUs
- Predictable performance — no noisy neighbor issues
- Teams get dedicated compute resources

### When to Use:

- Teams need guaranteed resources (GPU, high-memory)
- Compliance requires workload separation at the node level
- You want predictable performance for specific tenants
