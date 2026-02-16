#!/bin/bash

# Verify script for vCluster 109 - Step 1
echo "Verifying vCluster 109 - Step 1..."

# Check if vCluster CLI is installed
if ! command -v vcluster &> /dev/null; then
    echo "ERROR: vCluster CLI is not installed"
    exit 1
fi

# Check if we're in the right directory
if [ ! -f "vcluster.yaml" ]; then
    echo "ERROR: vcluster.yaml file not found"
    exit 1
fi

# Check if vCluster is running
if ! kubectl config current-context | grep -q "my-vcluster-context"; then
    echo "ERROR: Not connected to vCluster"
    exit 1
fi

echo "Step 1 verification passed!"