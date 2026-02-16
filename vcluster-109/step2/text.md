# Deploying External Secrets Operator to vCluster

In this step, we'll deploy External Secrets Operator to our vCluster.

First, let's check if we have the vCluster CLI installed and configured:

```bash
vcluster --version
```

Next, let's create a simple deployment that we'll use to test our External Secrets integration:

```yaml
# deployment.yaml - Simple application deployment with secret reference
apiVersion: apps/v1
kind: Deployment
metadata:
  name: secret-test-app
  labels:
    app: secret-test-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: secret-test-app
  template:
    metadata:
      labels:
        app: secret-test-app
    spec:
      containers:
      - image: nginx:latest
        name: nginx
        ports:
        - containerPort: 80
        env:
        - name: DB_PASSWORD
          valueFrom:
            secretKeyRef:
              name: db-secret
              key: password
        - name: DB_USER
          valueFrom:
            secretKeyRef:
              name: db-secret
              key: username
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
  name: secret-test-app
spec:
  selector:
    app: secret-test-app
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
kubectl get pods -l app=secret-test-app --kubeconfig kubeconfig.yaml
```

However, we still need to set up the External Secrets configuration to actually provide the secrets.