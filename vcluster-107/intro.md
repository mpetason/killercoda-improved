# Welcome to vCluster 107 — Integration with GitOps Tools

## What is vCluster?

vCluster lets teams run virtual Kubernetes clusters on existing host clusters, giving each tenant an isolated control plane without creating separate physical clusters. It supports tenancy models from simple namespace isolation to fully dedicated nodes, GPUs, and bare metal. Environments are defined declaratively for easy, repeatable provisioning. By consolidating many virtual clusters onto fewer hosts, teams cut Kubernetes costs and simplify multi-tenant operations.

## What You'll Learn

In this scenario, you'll learn how to integrate vCluster with ArgoCD and GitHub Actions to create a complete GitOps workflow for managing virtual clusters.

You'll learn how to:
- Set up GitHub Actions workflows for vcluster management
- Deploy vclusters using ArgoCD Application definitions
- Automate vcluster lifecycle management through GitOps
- Integrate external tools like cert-manager and external secrets with vclusters
- Implement proper cleanup procedures for temporary vclusters

## What This Lab Covers

This lab builds on the concepts learned in previous vCluster scenarios and demonstrates advanced usage patterns for production environments. You'll learn how to implement complete GitOps workflows that automate vCluster deployment, management, and cleanup processes.

After completing this scenario, you'll have the knowledge needed to implement production-grade vCluster deployments using GitOps best practices.