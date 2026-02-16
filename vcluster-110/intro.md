# Welcome to vCluster 110

## What is vCluster?

vCluster lets teams run virtual Kubernetes clusters on existing host clusters, giving each tenant an isolated control plane without creating separate physical clusters. It supports tenancy models from simple namespace isolation to fully dedicated nodes, GPUs, and bare metal. Environments are defined declaratively for easy, repeatable provisioning. By consolidating many virtual clusters onto fewer hosts, teams cut Kubernetes costs and simplify multi-tenant operations.

## What does this lab cover?

In this lab we are going to cover how to use vCluster with monitoring and observability using Prometheus and Grafana. This scenario demonstrates how to set up comprehensive monitoring for vCluster environments to gain insights into cluster performance, application behavior, and resource utilization.

We will:
- Set up a vCluster with Prometheus and Grafana integration
- Configure monitoring for both host and vCluster resources
- Deploy sample applications to demonstrate monitoring
- Set up alerts and dashboards
- Test observability features and metrics collection

This lab builds on the concepts learned in previous vCluster scenarios and demonstrates advanced usage patterns for monitoring and observability in virtual clusters.

Thanks for checking this lab out. We think vCluster with comprehensive monitoring is very powerful and would love to hear from you if you have any feedback.