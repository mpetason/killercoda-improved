# Killercoda Scenarios for vCluster

This directory contains improved vCluster scenarios for Killercoda labs.

## Available Scenarios

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