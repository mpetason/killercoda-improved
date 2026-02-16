# Deploying Monitoring Stack to vCluster

In this step, we'll deploy the monitoring stack to our vCluster.

First, let's check if we have the vCluster CLI installed and configured:

```bash
vcluster --version
```

Next, let's create a simple deployment that we'll use to test our monitoring:

```yaml
# monitoring-test-app.yaml - Simple application deployment for monitoring
apiVersion: apps/v1
kind: Deployment
metadata:
  name: monitoring-test-app
  labels:
    app: monitoring-test-app
spec:
  replicas: 2
  selector:
    matchLabels:
      app: monitoring-test-app
  template:
    metadata:
      labels:
        app: monitoring-test-app
      annotations:
        prometheus.io/scrape: "true"
        prometheus.io/port: "8080"
    spec:
      containers:
      - image: nginx:latest
        name: nginx
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
  name: monitoring-test-app
spec:
  selector:
    app: monitoring-test-app
  ports:
  - port: 80
    targetPort: 80
```

Now, let's deploy this application to our vCluster:

```bash
# Connect to vCluster
vcluster connect my-vcluster --server vcluster-k8s-api.example.com --print > kubeconfig.yaml

# Deploy the application
kubectl apply -f monitoring-test-app.yaml --kubeconfig kubeconfig.yaml
```

After deployment, we can verify that the application is running:

```bash
kubectl get pods -l app=monitoring-test-app --kubeconfig kubeconfig.yaml
```

We also need to configure the monitoring components to properly scrape metrics from our vCluster.