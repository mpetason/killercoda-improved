#!/bin/bash

# Verify script for vCluster 109 - Step 2
echo "Verifying vCluster 109 - Step 2..."

# Check if required pods are running
if ! kubectl get pods | grep -q "nginx"; then
    echo "ERROR: nginx pod not found"
    exit 1
fi

if ! kubectl get pods | grep -q "test-pod"; then
    echo "ERROR: test-pod not found"
    exit 1
fi

# Check if network policy was applied
if ! kubectl get networkpolicies | grep -q "allow-all"; then
    echo "ERROR: allow-all network policy not found"
    exit 1
fi

echo "Step 2 verification passed!"