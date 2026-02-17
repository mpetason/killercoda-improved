# Simulate Disaster — Delete vCluster

Now let's simulate a disaster by completely deleting the vCluster. This removes all virtual cluster resources from the host.

## Delete the vCluster

`vcluster delete backup-demo`{{exec}}

## Verify Destruction

`vcluster list`{{exec}}

`kubectl get all -n backup-ns`{{exec}}

The vCluster and all its resources are gone. In a real disaster, this could happen due to accidental deletion, namespace cleanup, or infrastructure failure.

## Verify Our Backups Still Exist

`ls -la /root/backup-all.yaml /root/vcluster-backup.tar.gz`{{exec}}

Our backup files are safe on the local filesystem. In production, these would be stored in object storage (S3, GCS), a backup service, or a version control system.
