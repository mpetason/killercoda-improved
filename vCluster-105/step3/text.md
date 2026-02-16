# Step 3 — Restoring vClusters from Backups

In this step, we'll demonstrate how to restore a vCluster from a backup, which is a critical part of disaster recovery.

First, let's see what's currently in our namespace:
`kubectl get all -n team-x`{{exec}}

Now, let's simulate a scenario where we need to restore our vCluster. First, we'll disconnect from the current vCluster:
`vcluster disconnect`{{exec}}

Let's try to restore our vCluster from the snapshot we created earlier:
`vcluster restore my-advanced-cluster "container:///tmp/my-snapshot.tar.gz" --restore-volumes`{{exec}}

This command restores the vCluster from our local snapshot and includes volume restoration. The `--restore-volumes` flag ensures that persistent data is also restored.

After restoration, let's verify our vCluster is running:
`vcluster list`{{exec}}

Restoring from backups is crucial for disaster recovery and ensures business continuity in case of unexpected failures or data corruption.