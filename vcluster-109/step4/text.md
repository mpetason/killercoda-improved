# Advanced Network Policy Patterns

In this step, we'll explore more advanced network policy patterns that can be used in vCluster environments.

Let's create a network policy that allows traffic only from specific namespaces:
```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-from-namespace
spec:
  podSelector: {}
  policyTypes:
  - Ingress
  ingress:
  - from:
    - namespaceSelector:
        matchLabels:
          name: frontend-namespace
` ``

Let's create a separate namespace and apply this policy:
```bash
kubectl create namespace frontend-namespace
kubectl label namespace frontend-namespace name=frontend-namespace
` ``

Let's create a pod in that namespace:
```bash
kubectl run frontend-pod --image=nginx --namespace=frontend-namespace
` ``

Now let's create and apply the policy:
```bash
cat > allow-from-namespace.yaml << EOF
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-from-namespace
spec:
  podSelector: {}
  policyTypes:
  - Ingress
  ingress:
  - from:
    - namespaceSelector:
        matchLabels:
          name: frontend-namespace
EOF

kubectl apply -f allow-from-namespace.yaml
` ``

Let's test if we can access the service from the frontend namespace:
```bash
kubectl exec test-pod -- wget -qO- http://frontend-namespace.frontend-namespace.svc.cluster.local:80
` ``

This should work because we're allowing traffic from the frontend-namespace.

Let's also test a more restrictive policy that allows traffic only from specific IP ranges:
```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-from-ip-range
spec:
  podSelector: {}
  policyTypes:
  - Ingress
  ingress:
  - from:
    - ipBlock:
        cidr: 10.0.0.0/8
` ``

Let's apply this policy:
```bash
cat > allow-from-ip-range.yaml << EOF
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-from-ip-range
spec:
  podSelector: {}
  policyTypes:
  - Ingress
  ingress:
  - from:
    - ipBlock:
        cidr: 10.0.0.0/8
EOF

kubectl apply -f allow-from-ip-range.yaml
` ``

Network policies are a powerful tool for securing vCluster environments. They provide fine-grained control over pod communication and help enforce security best practices in multi-tenant environments.