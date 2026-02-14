# vCluster 102 - Multi-Tenancy Isolation

## What You'll Learn

In this scenario, you'll explore how vCluster enables true multi-tenancy by allowing multiple tenants to run the same application names without conflicts.

## Why This Matters

Multi-tenancy is a key benefit of vCluster. When multiple teams or applications need to use the same names (like "my-app"), vCluster ensures they don't interfere with each other because each tenant operates in its own isolated control plane.

![vCluster Multi-Tenancy](./assets/multi-tenancy.png)

## What This Lab Covers

- Creating multiple vClusters in separate namespaces
- Deploying identical applications in different vClusters
- Exposing applications via port-forwarding
- Verifying independent access to each application
- Understanding how vCluster provides true isolation

This scenario demonstrates how vCluster enables you to share the same Kubernetes cluster while maintaining complete isolation between tenants.