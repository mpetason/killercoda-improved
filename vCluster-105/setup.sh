#!/bin/bash

# Install vCluster CLI (if not already installed)
if ! command -v vcluster &> /dev/null; then
    echo "Installing vCluster CLI..."
    curl -L https://github.com/loft-sh/vcluster/releases/latest/download/vcluster-linux-amd64.tar.gz | tar xz
    sudo mv vcluster /usr/local/bin/vcluster
    sudo chmod +x /usr/local/bin/vcluster
fi

# Verify installation
vcluster version

echo "vCluster CLI already installed"