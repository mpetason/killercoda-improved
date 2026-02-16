# Step 1 — Creating vCluster Snapshots

In this step, we'll create snapshots of our advanced vCluster to establish a backup strategy.

First, let's check our current vCluster setup:
`vcluster list`{{exec}}

Let's create a snapshot of our advanced vCluster:
`vcluster snapshot create my-advanced-cluster "container:///tmp/my-snapshot.tar.gz" --include-volumes`{{exec}}

This command creates a snapshot of our vCluster including volumes. The `--include-volumes` flag ensures that persistent volume data is also backed up.

Let's check the status of our snapshot creation:
`vcluster snapshot get my-advanced-cluster "container:///tmp/my-snapshot.tar.gz"`{{exec}}

The snapshot includes:
- The vCluster's etcd datastore
- Persistent volume data (when using --include-volumes)
- All configuration and state information

Snapshots are essential for disaster recovery as they capture the complete state of a vCluster at a specific point in time.