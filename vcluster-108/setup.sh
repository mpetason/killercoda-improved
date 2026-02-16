#!/bin/bash

# Setup script for vCluster 108 - Istio Ambient Mode

# Install vCluster CLI
echo "Installing vCluster CLI..."
curl -L -o vcluster "https://github.com/loft-sh/vcluster/releases/latest/download/vcluster-linux-amd64" && sudo install -c -m 0755 vcluster /usr/local/bin && rm -f vcluster

# Verify installation
echo "Verifying vCluster installation..."
vcluster --version

# Install Helm (needed for Istio)
echo "Installing Helm..."
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Install Istio CLI for ambient mode
echo "Installing Istio CLI..."
curl -L https://istio.io/downloadIstio | sh -
export PATH="$PATH:$(pwd)/istio-1.19.0/bin"
echo "Istio CLI installed and added to PATH"

echo "Setup complete!"