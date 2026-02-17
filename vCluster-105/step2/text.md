# Export Resources as YAML Backup

The simplest backup method is exporting Kubernetes resource definitions as YAML files. This captures the declarative state of your workloads.

## Export All Resources

Export deployments, services, configmaps, and secrets from the default namespace:

`kubectl get deployments -o yaml > /root/backup-deployments.yaml`{{exec}}

`kubectl get services -o yaml > /root/backup-services.yaml`{{exec}}

`kubectl get configmaps -o yaml > /root/backup-configmaps.yaml`{{exec}}

`kubectl get secrets -o yaml > /root/backup-secrets.yaml`{{exec}}

## Combine Into a Single Backup File

`cat /root/backup-deployments.yaml /root/backup-services.yaml /root/backup-configmaps.yaml /root/backup-secrets.yaml > /root/backup-all.yaml`{{exec}}

## Verify the Backup

`ls -la /root/backup-*.yaml`{{exec}}

`head -20 /root/backup-all.yaml`{{exec}}

## Important Notes

- YAML export captures **resource definitions** but not stateful data (database contents, PVC data)
- The exported YAML includes cluster-specific metadata (UIDs, resourceVersion) that will be regenerated on restore
- For a complete backup of stateful applications, you would also need to back up PersistentVolume data
- This method is best for **declarative workloads** where the resource definitions are the source of truth
