#!/bin/bash

# Verify script for vCluster 109 - Step 5
echo "Verifying vCluster 109 - Step 5..."

# Check that all network policies are present
if ! kubectl get networkpolicies | grep -q "allow-all"; then
    echo "ERROR: allow-all network policy not found"
    exit 1
fi

if ! kubectl get networkpolicies | grep -q "allow-from-specific-pods"; then
    echo "ERROR: allow-from-specific-pods network policy not found"
    exit 1
fi

if ! kubectl get networkpolicies | grep -q "allow-from-namespace"; then
    echo "ERROR: allow-from-namespace network policy not found"
    exit 1
fi

if ! kubectl get networkpolicies | grep -q "allow-from-ip-range"; then
    echo "ERROR: allow-from-ip-range network policy not found"
    exit 1
fi

echo "Step 5 verification passed!"