# Welcome to vCluster 108

## What is vCluster?

vCluster lets teams run virtual Kubernetes clusters on existing host clusters, giving each tenant an isolated control plane without creating separate physical clusters. It supports tenancy models from simple namespace isolation to fully dedicated nodes, GPUs, and bare metal. Environments are defined declaratively for easy, repeatable provisioning. By consolidating many virtual clusters onto fewer hosts, teams cut Kubernetes costs and simplify multi-tenant operations.

## What does this lab cover?

In this lab we are going to cover how to use vCluster with service mesh integration, specifically with Istio. This scenario demonstrates how to deploy and configure Istio in a vCluster environment to provide service mesh capabilities.

We will:
- Set up a vCluster with Istio integration
- Deploy a sample application in the vCluster
- Configure Istio for traffic management and observability
- Test service mesh features like circuit breaking and retries
- Implement security policies with Istio

This lab builds on the concepts learned in previous vCluster scenarios and demonstrates advanced usage patterns for service mesh integration in virtual clusters.

Thanks for checking this lab out. We think vCluster with Istio integration is very powerful and would love to hear from you if you have any feedback.