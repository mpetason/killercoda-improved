# vCluster 101 - 103: Production-Ready Kubernetes Multi-Tenancy Scenarios

Welcome to the complete vCluster learning path! This collection of scenarios demonstrates how to use vCluster for Kubernetes multi-tenancy in production environments.

## Scenario 101: vCluster 101 - Basic vCluster Operations

This is the foundation scenario that teaches you how to create, inspect, and manage vClusters.

### What You'll Learn
- Installing the vCluster CLI
- Creating a vCluster in a host cluster
- Connecting to and inspecting vClusters
- Deploying standard Kubernetes resources in vClusters
- Understanding vCluster isolation from the host cluster
- Cleaning up vClusters

### Key Concepts
- vCluster provides isolated Kubernetes control planes
- Each vCluster has its own API server and database
- Resources created in vClusters are not visible in the host cluster
- True multi-tenancy at the control plane level

## Scenario 102: vCluster 102 - Multi-Tenancy Isolation

This scenario demonstrates how vCluster enables multi-tenancy by allowing teams to use the same application names without conflicts.

### What You'll Learn
- Creating multiple vClusters in separate namespaces
- Deploying identical applications in different vClusters
- Exposing applications via port-forwarding
- Verifying independent access to each application
- Understanding complete isolation between vClusters

### Key Concepts
- Same application names can be used in different vClusters
- Complete isolation at control plane level
- Independent network namespaces
- Shared infrastructure with tenant independence

## Scenario 103: vCluster 103 - Advanced CRD Management

This advanced scenario shows how vCluster enables sophisticated CRD management and tenancy models.

### What You'll Learn
- Understanding CRD differences between host and vClusters
- Installing CRDs in host cluster
- Installing different CRD versions in vClusters
- Comparing CRD versions in different environments
- Managing complex tenancy scenarios

### Key Concepts
- True CRD isolation between host and vClusters
- Different teams can use different CRD versions
- Custom resources can be managed independently
- Flexible tenancy models for complex deployments

## Scenario 104: vCluster 104 - Advanced Configuration and Performance Optimization

This scenario explores advanced vCluster configuration options and performance optimization techniques for production environments.

### What You'll Learn
- Advanced vCluster configuration flags and options
- Resource allocation and performance tuning
- Monitoring and observability setup
- Network optimization techniques
- Scaling vClusters for production workloads

### Key Concepts
- Advanced vCluster configuration for production use
- Resource management for optimal performance
- Monitoring solutions for vCluster environments
- Network optimization for vCluster workloads
- Scaling strategies for enterprise deployments

## Scenario 105: vCluster 105 - Practical Use Cases and Integration Patterns

This scenario explores practical real-world use cases for vCluster and demonstrates integration patterns with common Kubernetes tools and workflows.

### What You'll Learn
- CI/CD integration with vCluster
- Developer sandbox environments
- Testing and staging environments
- Integration with service meshes
- Backup and disaster recovery strategies

### Key Concepts
- vCluster in CI/CD pipelines for testing
- Developer self-service environments
- Isolated testing and staging scenarios
- Integration with service mesh technologies
- Backup and recovery for vCluster environments

## Getting Started

Each scenario is designed to be self-contained and can be run independently. Start with vCluster 101 to learn the basics, then progress to 102 and 103 for advanced concepts.

## Prerequisites

- Kubernetes cluster with kubectl access
- vCluster CLI installed
- Docker (for proxy container in demo environments)

## Resources

- [vCluster Documentation](https://www.vcluster.com/docs/)
- [vCluster GitHub Repository](https://github.com/loft-sh/vcluster)
- [Community Slack](https://slack.vcluster.com)

## Next Steps

After completing these scenarios, you can explore:
- vCluster 104: Advanced networking and service isolation
- vCluster 105: Integration with CI/CD pipelines
- vCluster 106: Advanced security and RBAC configurations

This learning path provides a complete foundation for understanding and implementing vCluster in production Kubernetes environments.