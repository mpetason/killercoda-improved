# DR Planning Summary and Cleanup

## Backup Strategies for vClusters

| Strategy | What It Captures | Recovery Speed | Complexity |
|----------|-----------------|----------------|------------|
| **YAML Export** | Resource definitions | Fast | Low |
| **Data Store Backup** | Complete control plane state | Medium | Medium |
| **Velero** | Resources + PV data | Medium | High |
| **GitOps (ArgoCD/Flux)** | Declarative state in git | Fast | Medium |

## Recommendations

- **Development/Testing**: YAML export is usually sufficient. Resources can be quickly re-created from definitions.
- **Production**: Combine data store backups with a GitOps approach. Store vcluster.yaml configurations in version control so vClusters can be recreated consistently.
- **Stateful Workloads**: If your vCluster runs stateful applications with PersistentVolumes, consider Velero or CSI volume snapshots for complete data protection.
- **Backup Frequency**: Align backup frequency with your Recovery Point Objective (RPO). Critical production workloads may need continuous backup; development environments may only need daily snapshots.

## Cleanup

`vcluster disconnect`{{exec}}

`vcluster delete backup-demo`{{exec}}

`rm -f /root/backup-*.yaml /root/vcluster-backup.tar.gz`{{exec}}

`rm -rf /root/vcluster-data-backup`{{exec}}

`vcluster list`{{exec}}
