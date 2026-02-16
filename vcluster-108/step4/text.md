# Testing Istio Ambient Mode

In this step, we'll test our Istio ambient mode implementation.

Let's deploy our configurations to the vCluster:

```bash
# Apply the virtual service
kubectl apply -f virtual-service.yaml --kubeconfig kubeconfig.yaml

# Apply the destination rule
kubectl apply -f destination-rule.yaml --kubeconfig kubeconfig.yaml

# Apply the ambient configuration
kubectl apply -f ambient-config.yaml --kubeconfig kubeconfig.yaml
```

Now let's verify that our Istio ambient mode is working:

```bash
# Check if Istio components are running
kubectl get pods -n istio-system --kubeconfig kubeconfig.yaml

# Check if our application pods have sidecars
kubectl get pods -l app=httpbin --kubeconfig kubeconfig.yaml

# Verify Istio configuration
kubectl get virtualservice httpbin --kubeconfig kubeconfig.yaml

# Check Istio status
istioctl proxy-status --kubeconfig kubeconfig.yaml
```

Let's also test traffic routing:

```bash
# Test that the service is accessible
kubectl exec -it deployment/httpbin -- curl -v http://httpbin --kubeconfig kubeconfig.yaml

# Test that we can access the Istio dashboard if it's installed
kubectl port-forward svc/istio-ingressgateway -n istio-system 8080:80 --kubeconfig kubeconfig.yaml
```

The ambient mode should:
1. Automatically inject sidecars into pods
2. Route traffic according to our VirtualService configuration
3. Apply traffic policies from our DestinationRule
4. Provide observability through Istio dashboards