# Welcome to vCluster 107

## What is vCluster?

vCluster lets teams run virtual Kubernetes clusters on existing host clusters, giving each tenant an isolated control plane without creating separate physical clusters. It supports tenancy models from simple namespace isolation to fully dedicated nodes, GPUs, and bare metal. Environments are defined declaratively for easy, repeatable provisioning. By consolidating many virtual clusters onto fewer hosts, teams cut Kubernetes costs and simplify multi-tenant operations.

## What does this lab cover?

In this lab we are going to cover how to integrate vCluster with ArgoCD and GitHub Actions to create a complete GitOps workflow for managing virtual clusters.

We will:
- Set up GitHub Actions workflows for vcluster management
- Deploy vclusters using ArgoCD Application definitions
- Automate vcluster lifecycle management through GitOps
- Integrate external tools like cert-manager and external secrets with vclusters
- Implement proper cleanup procedures for temporary vclusters

This lab builds on the concepts learned in previous vCluster scenarios and demonstrates advanced usage patterns for production environments.

Thanks for checking this lab out. We think vCluster integration with GitOps tools is pretty powerful and would love to hear from you if you have any feedback.