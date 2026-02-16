#!/bin/bash

# Setup script for vCluster 110 - Monitoring and Observability

# Install vCluster CLI
echo "Installing vCluster CLI..."
curl -L -o vcluster "https://github.com/loft-sh/vcluster/releases/latest/download/vcluster-linux-amd64" && sudo install -c -m 0755 vcluster /usr/local/bin && rm -f vcluster

# Verify installation
echo "Verifying vCluster installation..."
vcluster --version

# Install Helm (needed for Prometheus and Grafana)
echo "Installing Helm..."
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Install Prometheus and Grafana
echo "Installing Prometheus and Grafana..."
kubectl apply -f https://raw.githubusercontent.com/prometheus-operator/kube-prometheus/main/manifests/setup/0prometheus-operator-0alertmanagerCustomResourceDefinition.yaml
kubectl apply -f https://raw.githubusercontent.com/prometheus-operator/kube-prometheus/main/manifests/setup/0prometheus-operator-0prometheusCustomResourceDefinition.yaml
kubectl apply -f https://raw.githubusercontent.com/prometheus-operator/kube-prometheus/main/manifests/setup/0prometheus-operator-0servicemonitorCustomResourceDefinition.yaml
kubectl apply -f https://raw.githubusercontent.com/prometheus-operator/kube-prometheus/main/manifests/setup/0prometheus-operator-0prometheusruleCustomResourceDefinition.yaml

echo "Setup complete!"