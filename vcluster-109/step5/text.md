# Testing and Verifying Network Policies

In this final step, we'll test our network policies to ensure they're working as expected.

Let's first check all our network policies:
```bash
kubectl get networkpolicies
kubectl describe networkpolicy allow-all
kubectl describe networkpolicy allow-from-specific-pods
kubectl describe networkpolicy allow-from-namespace
kubectl describe networkpolicy allow-from-ip-range
` ``

Let's test connectivity between our pods to verify policy enforcement:
```bash
# Test from test-pod to nginx deployment (should work - no restrictions)
kubectl exec test-pod -- wget -qO- http://nginx:80

# Test from test-pod to frontend deployment (should work - has matching label)
kubectl exec test-pod -- wget -qO- http://frontend:80

# Test from test-pod to backend deployment (should fail - no matching label)
kubectl exec test-pod -- wget -qO- http://backend:80
` ``

Let's also test with a pod in the frontend namespace:
```bash
# Test from test-pod to frontend-namespace service (should work - from allowed namespace)
kubectl exec test-pod -- wget -qO- http://frontend-namespace.frontend-namespace.svc.cluster.local:80
` ``

Let's also test that we can still access services from within the cluster:
```bash
kubectl get svc
kubectl get pods
` ``

Network policies in vCluster environments work the same way as in regular Kubernetes clusters. They provide a powerful mechanism for securing communication between pods while maintaining the flexibility of virtual clusters.

## Summary

In this lab, we've learned how to:
1. Set up a vCluster with network policy support
2. Create basic network policies to control pod communication
3. Implement more advanced network policies with namespace and IP restrictions
4. Test and verify network policy enforcement

Network policies are a crucial part of securing vCluster environments, especially in multi-tenant scenarios where isolation between teams is important.