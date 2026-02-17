# Back Up the vCluster Data Store

For a more complete backup, we can back up the vCluster's underlying data store. The default k3s-based vCluster uses an embedded SQLite database stored within the vCluster pod.

## Disconnect from the vCluster

`vcluster disconnect`{{exec}}

## Identify the vCluster Pod

`kubectl get pods -n backup-ns -l app=vcluster`{{exec}}

## Back Up the Data Store

The vCluster's data is stored in a PersistentVolume. Let's identify it:

`kubectl get pvc -n backup-ns`{{exec}}

We can copy the data from the vCluster pod. The k3s data store is located at `/data/server/db/` inside the pod:

`kubectl cp backup-ns/$(kubectl get pod -n backup-ns -l app=vcluster -o jsonpath='{.items[0].metadata.name}'):/data /root/vcluster-data-backup`{{exec}}

## Create a Compressed Archive

`tar czf /root/vcluster-backup.tar.gz -C /root vcluster-data-backup`{{exec}}

## Verify the Backup

`ls -la /root/vcluster-backup.tar.gz`{{exec}}

`tar tzf /root/vcluster-backup.tar.gz | head -10`{{exec}}

This data store backup captures the complete state of the vCluster's control plane, including all resource definitions, RBAC, and cluster configuration.
