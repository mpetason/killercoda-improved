#!/bin/bash

# Verify script for vCluster 109 - Step 3
echo "Verifying vCluster 109 - Step 3..."

# Check if required deployments are running
if ! kubectl get deployments | grep -q "frontend"; then
    echo "ERROR: frontend deployment not found"
    exit 1
fi

if ! kubectl get deployments | grep -q "backend"; then
    echo "ERROR: backend deployment not found"
    exit 1
fi

# Check if network policy was applied
if ! kubectl get networkpolicies | grep -q "allow-from-specific-pods"; then
    echo "ERROR: allow-from-specific-pods network policy not found"
    exit 1
fi

echo "Step 3 verification passed!"