# Private Nodes + Autonodes

Private Nodes give a vCluster **exclusive ownership** of nodes.

Autonodes allow the vCluster to automatically **create and remove nodes** based on workload demand using Karpenter.

These features provide the **strongest form of isolation**.

![Private Nodes](../assets/private_nodes_killercoda.png)

### Example Configuration:

```yaml
privateNodes:
  enabled: true
  autonodes:
    enabled: true
```

### Benefits:

- Highest isolation
- Auto-scaling node pools per tenant
- Ideal for:
  - Compliance environments
  - Sensitive workloads
  - GPU Clouds
  - Multi-Cloud

### When to Use:

- Strict compliance or security requirements
- Workloads that must not share hardware with other tenants
- Dynamic scaling needs where each tenant's nodes should scale independently
- Multi-cloud deployments where tenants need nodes in different regions
