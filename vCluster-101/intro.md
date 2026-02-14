# Welcome to vCluster 101 - Quick Start Guide

## What is vCluster?

vCluster lets teams run virtual Kubernetes clusters on existing host clusters, giving each tenant an isolated control plane without creating separate physical clusters. It supports tenancy models from simple namespace isolation to fully dedicated nodes, GPUs, and bare metal. Environments are defined declaratively for easy, repeatable provisioning. By consolidating many virtual clusters onto fewer hosts, teams cut Kubernetes costs and simplify multi-tenant operations.

![vCluster Architecture](./assets/shared-nodes.png)

## What this lab covers

In this lab we will cover the essential concepts and basic operations of vCluster:

- Install the vCluster CLI
- Deploy a vCluster
- Connect to and inspect the vCluster
- Create a Deployment in the vCluster and view resources
- Disconnect from the vCluster and inspect the Host Cluster
- Clean up resources

We'll keep the introduction short and then move on to more customizations and advanced options in the following labs. The purpose of this guide is to give you an easier option to get started with vCluster, especially if you do not currently have access to a Kubernetes Cluster.

Thanks for checking this lab out. We think vCluster is pretty cool and would love to hear from you if you have any feedback.

<img referrerpolicy="no-referrer-when-downgrade" src="https://static.scarf.sh/a.png?x-pxid=a845cc0a-5bb1-4264-807e-20b6a5db69fa" />