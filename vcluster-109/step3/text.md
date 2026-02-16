# Implementing Specific Network Policies

In this step, we'll create more restrictive network policies to demonstrate how to control pod communication.

Let's first create a more specific network policy that only allows traffic from pods with a specific label:
```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-from-specific-pods
spec:
  podSelector:
    matchLabels:
      role: frontend
  policyTypes:
  - Ingress
  ingress:
  - from:
    - podSelector:
        matchLabels:
          role: frontend
` ``

Let's create this policy:
```bash
cat > allow-from-specific-pods.yaml << EOF
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-from-specific-pods
spec:
  podSelector:
    matchLabels:
      role: frontend
  policyTypes:
  - Ingress
  ingress:
  - from:
    - podSelector:
        matchLabels:
          role: frontend
EOF

kubectl apply -f allow-from-specific-pods.yaml
` ``

Now let's create a deployment with the matching label:
```bash
kubectl create deployment frontend --image=nginx --labels=role=frontend
kubectl expose deployment frontend --port=80
` ``

Let's also create a deployment without the label to test our policy:
```bash
kubectl create deployment backend --image=nginx
kubectl expose deployment backend --port=80
` ``

Let's check our pods:
```bash
kubectl get pods -l role=frontend
kubectl get pods -l role=backend
` ``

Let's test connectivity from a pod with the frontend label to a pod without the label:
```bash
kubectl exec test-pod -- wget -qO- http://backend:80
` ``

This should fail because the backend pod doesn't have the required label to be allowed by our policy.

Let's also test connectivity from a pod with the frontend label to a pod with the frontend label:
```bash
kubectl exec test-pod -- wget -qO- http://frontend:80
` ``

This should succeed because both pods have the appropriate labels.