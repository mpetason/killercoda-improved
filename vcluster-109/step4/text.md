# Testing External Secrets Integration

In this step, we'll test our External Secrets Operator implementation.

Let's deploy our configurations to the vCluster:

```bash
# Apply the secret store configurations
kubectl apply -f secret-store.yaml --kubeconfig kubeconfig.yaml

# Apply the external secret configuration
kubectl apply -f external-secret.yaml --kubeconfig kubeconfig.yaml

# Apply the AWS credentials (in a real scenario, you'd use proper secrets)
kubectl apply -f aws-credentials.yaml --kubeconfig kubeconfig.yaml
```

Now let's verify that our External Secrets are working:

```bash
# Check if ExternalSecrets controller is running
kubectl get pods -n external-secrets --kubeconfig kubeconfig.yaml

# Check if the secret was created
kubectl get secret db-secret --kubeconfig kubeconfig.yaml

# Check the ExternalSecret status
kubectl get externalsecret db-secret --kubeconfig kubeconfig.yaml

# Describe the ExternalSecret for detailed information
kubectl describe externalsecret db-secret --kubeconfig kubeconfig.yaml
```

Let's also test that our application can access the secrets:

```bash
# Check if our application pod can access the secret
kubectl exec -it deployment/secret-test-app -- env --kubeconfig kubeconfig.yaml

# Verify the secret content
kubectl get secret db-secret -o yaml --kubeconfig kubeconfig.yaml
```

The External Secrets integration should:
1. Automatically fetch secrets from external stores
2. Create Kubernetes secrets in the vCluster
3. Make those secrets available to applications
4. Handle secret rotation and updates automatically