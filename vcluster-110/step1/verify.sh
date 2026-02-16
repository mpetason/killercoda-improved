#!/bin/bash
# Verify vCluster 110 step 1
kubectl get pods -n monitoring &> /dev/null && echo "done"