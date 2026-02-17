# Restore from Backup

Let's restore our workloads by creating a new vCluster and re-applying the YAML backup.

## Create a New vCluster

`vcluster create backup-demo --namespace backup-ns`{{exec}}

## Re-apply the YAML Backup

We'll apply the individual backup files. Using individual files gives better control over the restore order:

`kubectl apply -f /root/backup-configmaps.yaml`{{exec}}

`kubectl apply -f /root/backup-secrets.yaml`{{exec}}

`kubectl apply -f /root/backup-deployments.yaml`{{exec}}

`kubectl apply -f /root/backup-services.yaml`{{exec}}

## Verify the Restore

`kubectl get deployments`{{exec}}

`kubectl get services`{{exec}}

`kubectl get configmaps`{{exec}}

`kubectl get pods`{{exec}}

You should see the nginx deployment running with 2 replicas, the service, and the configmap — all restored from the YAML backup.

## Important Notes

- Some resources may show warnings about already-existing defaults (like the `kubernetes` service) — these can be ignored
- The restored resources get new UIDs and metadata, but the functional configuration is preserved
- Stateful data (PVC contents) is not restored by this method — only resource definitions
- For full state recovery including the data store, you would restore the PVC data from the data store backup created in Step 3
