# Welcome to vCluster 109

## What is vCluster?

vCluster lets teams run virtual Kubernetes clusters on existing host clusters, giving each tenant an isolated control plane without creating separate physical clusters. It supports tenancy models from simple namespace isolation to fully dedicated nodes, GPUs, and bare metal. Environments are defined declaratively for easy, repeatable provisioning. By consolidating many virtual clusters onto fewer hosts, teams cut Kubernetes costs and simplify multi-tenant operations.

## What does this lab cover?

In this lab we are going to cover how to use vCluster with external secrets management using External Secrets Operator (ESO). This scenario demonstrates how to securely manage secrets in vCluster environments by integrating with external secret stores like AWS Secrets Manager, HashiCorp Vault, or Kubernetes secrets.

We will:
- Set up a vCluster with External Secrets Operator integration
- Configure external secret stores
- Deploy applications that consume external secrets
- Test secret synchronization and access
- Implement security best practices for secret management

This lab builds on the concepts learned in previous vCluster scenarios and demonstrates advanced usage patterns for secure secret management in virtual clusters.

Thanks for checking this lab out. We think vCluster with External Secrets Operator integration is very powerful and would love to hear from you if you have any feedback.