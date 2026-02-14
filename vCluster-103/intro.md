# vCluster 103 - Advanced CRD Management

## What You'll Learn

In this scenario, you'll explore how vCluster enables advanced CRD management and tenancy models. You'll learn how to handle different CRD versions in host and vCluster environments, and understand the isolation patterns that make vCluster powerful for multi-tenant Kubernetes deployments.

## Why This Matters

CRD (Custom Resource Definition) management is a critical aspect of Kubernetes multi-tenancy. vCluster allows you to:
- Install different versions of CRDs in host vs vClusters
- Run conflicting CRDs in different vClusters
- Manage complex tenancy scenarios with isolation at the control plane level

![CRD Isolation](./assets/crd-isolation.png)

## What This Lab Covers

- Understanding CRD differences between host and vClusters
- Installing CRDs in host cluster
- Installing different CRD versions in vClusters
- Comparing CRD versions in different environments
- Exploring tenancy models and isolation patterns

This scenario demonstrates how vCluster provides complete control plane isolation, which is essential for managing complex Kubernetes environments.