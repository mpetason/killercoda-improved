#!/bin/bash

# Setup script for vCluster 109 - Network Policies
echo "Setting up vCluster 109 environment..."

# Install vCluster CLI
echo "Installing vCluster CLI..."
curl -L https://github.com/fidelity/vcluster/releases/latest/download/vcluster-linux-amd64 -o /usr/local/bin/vcluster
chmod +x /usr/local/bin/vcluster

# Create the working directory
mkdir -p ~/vcluster-network-policies
cd ~/vcluster-network-policies

echo "vCluster 109 environment setup complete!"