# Step 2 — Advanced Backup Strategies

In this step, we'll explore more advanced backup strategies for vClusters, including cloud-based storage options.

Let's create another snapshot but this time to an OCI registry (which requires proper credentials):
`vcluster snapshot create my-advanced-cluster "oci://ghcr.io/my-organization/my-vcluster-backup:latest" --include-volumes`{{exec}}

This command creates a snapshot and pushes it to an OCI registry. This approach is useful for:
- Centralized backup storage
- Version control of backups
- Sharing backups across teams
- Long-term retention

Let's also check what snapshots we have available:
`vcluster snapshot list my-advanced-cluster`{{exec}}

For production environments, you should consider:
- Regular snapshot schedules
- Multiple backup locations
- Testing backup restoration procedures
- Retention policies for old backups

These backup strategies ensure that you can recover your vCluster environments in case of data loss or system failures.