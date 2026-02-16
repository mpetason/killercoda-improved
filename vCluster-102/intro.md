# vCluster 102 - Multi-Tenancy Isolation

## What is vCluster?

vCluster lets teams run virtual Kubernetes clusters on existing host clusters, giving each tenant an isolated control plane without creating separate physical clusters. It supports tenancy models from simple namespace isolation to fully dedicated nodes, GPUs, and bare metal. Environments are defined declaratively for easy, repeatable provisioning. By consolidating many virtual clusters onto fewer hosts, teams cut Kubernetes costs and simplify multi-tenant operations.

![vCluster Multi-Tenancy](./assets/multi-tenancy.png)

## What You'll Learn

In this scenario, you'll explore how vCluster enables true multi-tenancy by allowing multiple tenants to run the same application names without conflicts.

## What This Lab Covers

- Creating multiple vClusters in separate namespaces
- Deploying identical applications in different vClusters
- Exposing applications via port-forwarding
- Verifying independent access to each application
- Understanding how vCluster provides true isolation

This scenario demonstrates how vCluster enables you to share the same Kubernetes cluster while maintaining complete isolation between tenants.