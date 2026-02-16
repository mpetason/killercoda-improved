# Creating Network Policies

In this step, we'll create our first network policy to understand how network isolation works in vCluster.

First, let's create a simple application to test our network policies with:

```bash
kubectl create deployment nginx --image=nginx
kubectl expose deployment nginx --port=80
```

Let's also create a test pod that we'll use to verify our policies:

```bash
kubectl run test-pod --image=busybox --restart=Never -- sleep 3600
```

Now, let's examine the default network policy behavior. By default, all pods in a Kubernetes cluster can communicate with each other unless a network policy is explicitly defined to block traffic.

Let's check the pods and services we've created:
```bash
kubectl get pods
kubectl get services
```

Now let's create a simple network policy that allows all traffic (this is the default behavior):
```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-all
spec:
  podSelector: {}
  policyTypes:
  - Ingress
  - Egress
  ingress:
  - {}
  egress:
  - {}
` ``

Let's create this network policy:
```bash
cat > allow-all-policy.yaml << EOF
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-all
spec:
  podSelector: {}
  policyTypes:
  - Ingress
  - Egress
  ingress:
  - {}
  egress:
  - {}
EOF

kubectl apply -f allow-all-policy.yaml
` ``

Let's verify the policy was applied:
```bash
kubectl get networkpolicies
kubectl describe networkpolicy allow-all
` ``

This network policy allows all ingress and egress traffic to all pods in the namespace. It's equivalent to no network policy being applied.