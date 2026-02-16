#!/bin/bash

# Install vCluster CLI
echo "Installing vCluster CLI..."
curl -L https://github.com/loft-sh/vcluster/releases/latest/download/vcluster-linux-amd64.tar.gz | tar xz
sudo mv vcluster /usr/local/bin/vcluster
sudo chmod +x /usr/local/bin/vcluster

# Verify installation
vcluster version

# Create the namespace and vCluster needed for this scenario
kubectl create namespace team-x &> /dev/null || true

# Create a basic vCluster for this scenario
echo "Creating basic vCluster for advanced configuration scenario..."
vcluster create my-advanced-cluster --namespace team-x --connect=false

echo "vCluster CLI installed and basic vCluster ready for advanced configuration"