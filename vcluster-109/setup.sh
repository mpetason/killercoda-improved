#!/bin/bash

# Setup script for vCluster 109 - External Secrets Integration

# Install vCluster CLI
echo "Installing vCluster CLI..."
curl -L -o vcluster "https://github.com/loft-sh/vcluster/releases/latest/download/vcluster-linux-amd64" && sudo install -c -m 0755 vcluster /usr/local/bin && rm -f vcluster

# Verify installation
echo "Verifying vCluster installation..."
vcluster --version

# Install Helm (needed for External Secrets Operator)
echo "Installing Helm..."
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Install External Secrets Operator CLI
echo "Installing External Secrets Operator CLI..."
kubectl apply -f https://github.com/external-secrets/external-secrets/releases/latest/download/bundle.yaml

echo "Setup complete!"