# Deploying Istio Ambient Mode to vCluster

In this step, we'll deploy Istio with ambient mode to our vCluster.

First, let's check if we have the vCluster CLI installed and configured:

```bash
vcluster --version
```

Next, let's create a simple deployment that we'll use to test our Istio ambient mode integration:

```yaml
# deployment.yaml - Simple application deployment
apiVersion: apps/v1
kind: Deployment
metadata:
  name: httpbin
  labels:
    app: httpbin
spec:
  replicas: 2
  selector:
    matchLabels:
      app: httpbin
  template:
    metadata:
      labels:
        app: httpbin
    spec:
      containers:
      - image: docker.io/kennethreitz/httpbin
        name: httpbin
        ports:
        - containerPort: 80
        resources:
          requests:
            cpu: "100m"
            memory: "128Mi"
          limits:
            cpu: "200m"
            memory: "256Mi"
---
apiVersion: v1
kind: Service
metadata:
  name: httpbin
spec:
  selector:
    app: httpbin
  ports:
  - port: 80
    targetPort: 80
```

Now, let's deploy this application to our vCluster:

```bash
# Connect to vCluster
vcluster connect my-vcluster --server vcluster-k8s-api.example.com --print > kubeconfig.yaml

# Deploy the application
kubectl apply -f deployment.yaml --kubeconfig kubeconfig.yaml
```

After deployment, we can verify that the application is running:

```bash
kubectl get pods -l app=httpbin --kubeconfig kubeconfig.yaml
```