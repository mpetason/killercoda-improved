# Integration with Service Meshes

In this final step, we'll explore how vClusters integrate with service meshes like Istio or Linkerd.

Service meshes provide important capabilities like traffic management, security, and observability. vClusters work well with these tools:

`vcluster create mesh-cluster --namespace mesh --sync-namespace-annotations`{{exec}}

Let's install Istio in our vCluster:
`kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.18/samples/addons/istio.yaml`{{exec}}

We can then deploy a sample application with Istio sidecars:
`kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.18/samples/bookinfo/platform/kube/bookinfo.yaml`{{exec}}

Service mesh integration with vClusters provides:
- Traffic management capabilities
- Security features (mTLS, authorization)
- Observability (metrics, logs, traces)
- Service-to-service communication control

This combination allows teams to implement advanced networking features while maintaining the isolation benefits of vClusters.