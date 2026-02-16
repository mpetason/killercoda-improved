# Welcome to vCluster 105 — Backup and Disaster Recovery

## What is vCluster?

vCluster lets teams run virtual Kubernetes clusters on existing host clusters, giving each tenant an isolated control plane without creating separate physical clusters. It supports tenancy models from simple namespace isolation to fully dedicated nodes, GPUs, and bare metal. Environments are defined declaratively for easy, repeatable provisioning. By consolidating many virtual clusters onto fewer hosts, teams cut Kubernetes costs and simplify multi-tenant operations.

## What You'll Learn

In this scenario, we'll explore backup and disaster recovery strategies for vClusters, building on the advanced configuration concepts from vCluster 104.

We'll build on the advanced vCluster configuration we've been working with to:
- Create snapshots of vClusters
- Restore vClusters from backups
- Implement disaster recovery procedures
- Manage backup strategies for production environments

## What This Lab Covers

This scenario focuses on ensuring your vCluster environments can be protected and recovered in case of failures.