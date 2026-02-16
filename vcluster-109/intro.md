# Welcome to vCluster 109

## What is vCluster?

vCluster lets teams run virtual Kubernetes clusters on existing host clusters, giving each tenant an isolated control plane without creating separate physical clusters. It supports tenancy models from simple namespace isolation to fully dedicated nodes, GPUs, and bare metal. Environments are defined declaratively for easy, repeatable provisioning. By consolidating many virtual clusters onto fewer hosts, teams cut Kubernetes costs and simplify multi-tenant operations.

## What does this lab cover?

In this lab we are going to cover how to implement network policies in vCluster environments. This scenario demonstrates how to secure communication between pods within virtual clusters using Kubernetes Network Policies, which are a core part of Kubernetes networking and are completely open source.

We will:
- Set up a vCluster with default networking
- Create network policies to control pod communication
- Test network policy enforcement
- Deploy applications and verify network isolation
- Implement advanced network policy patterns

This lab builds on the concepts learned in previous vCluster scenarios and demonstrates how to secure virtual clusters using standard Kubernetes networking primitives.

Thanks for checking this lab out. We think vCluster with proper network policies is very powerful and would love to hear from you if you have any feedback.