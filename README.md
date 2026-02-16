# Killercoda Scenarios for vCluster

This directory contains improved vCluster scenarios for Killercoda labs.

## Available Scenarios

### vCluster 101: Hello vCluster
- Install the vCluster CLI
- Deploy a vCluster
- Connect to and inspect the vCluster
- Create a Deployment in the vCluster and view resources
- Disconnect from the vCluster and inspect the Host Cluster
- Clean up resources

### vCluster 102: Multi-Tenancy Isolation via Same Application Names
- Demonstrate how vClusters allow two tenants to run the same application and service names without conflict
- Create two vClusters
- Deploy same app name in both
- Expose both apps
- Verify independent access
- Cleanup & wrap-up

### vCluster 103: vCluster Tenancy Models & CRDs
- Learn about different vCluster tenancy models
- Understand vCluster Custom Resource Definitions (CRDs)
- Explore different isolation patterns

### vCluster 104: vCluster Multi-Step Verification
- Multi-step verification scenario for vCluster
- Comprehensive testing of vCluster functionality

### vCluster 105: vCluster Network Traffic
- Network traffic scenario for vCluster
- Understand network behavior in virtual clusters

### vCluster 106: vCluster Custom Content
- Custom content scenario for vCluster
- Advanced customization techniques

### vCluster 107: vCluster Security Best Practices
- Security best practices for vCluster environments
- Secure configuration and deployment strategies

### vCluster 108: Istio Ambient Mode
- Learn how to deploy and configure Istio ambient mode in vCluster
- Implement traffic management with VirtualServices and DestinationRules
- Test ambient mode functionality in a virtual cluster environment

### vCluster 109: External Secrets Integration
- Learn how to integrate External Secrets Operator with vCluster
- Configure secure access to external secret stores (AWS, Vault)
- Deploy applications that consume external secrets

### vCluster 110: Monitoring and Observability
- Learn how to set up monitoring and observability for vCluster environments
- Configure Prometheus and Grafana for metrics collection
- Create alerting rules and dashboards for cluster monitoring

## Getting Started

Each scenario directory contains:
- `intro.md`: Introduction to the scenario
- `finish.md`: Conclusion and summary
- Multiple `stepX/text.md` files: Step-by-step instructions
- `setup.sh`: Setup script for the scenario
- `index.json`: Scenario metadata

## Prerequisites

- Docker
- Kubernetes cluster
- vCluster CLI installed
- Helm (for monitoring and secrets scenarios)

## Usage

1. Navigate to the desired scenario directory
2. Follow the step-by-step instructions
3. Run the setup script if needed
4. Complete the exercises to learn vCluster concepts