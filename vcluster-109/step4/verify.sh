#!/bin/bash

# Verify script for vCluster 109 - Step 4
echo "Verifying vCluster 109 - Step 4..."

# Check if required namespace exists
if ! kubectl get namespace | grep -q "frontend-namespace"; then
    echo "ERROR: frontend-namespace not found"
    exit 1
fi

# Check if network policy was applied
if ! kubectl get networkpolicies | grep -q "allow-from-namespace"; then
    echo "ERROR: allow-from-namespace network policy not found"
    exit 1
fi

# Check if pod in frontend namespace exists
if ! kubectl get pods -n frontend-namespace | grep -q "frontend-pod"; then
    echo "ERROR: frontend-pod not found in frontend-namespace"
    exit 1
fi

echo "Step 4 verification passed!"