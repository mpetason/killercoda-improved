# Network Optimization

In this final step of vCluster 104, we'll explore network optimization techniques for vClusters.

Network performance is critical for vCluster operations. Let's look at how to optimize network settings:

`vcluster create my-network-cluster --namespace team-x --network-plugin cni --sync-namespace-annotations`{{exec}}

Key network options include:
- `--network-plugin` - Specify the network plugin to use
- `--sync-namespace-annotations` - Sync namespace annotations for better networking

Let's check the network configuration:
`kubectl get configmap -n team-x`{{exec}}

We can also examine network policies:
`kubectl get networkpolicies -n team-x`{{exec}}

Additionally, you can configure service CIDR ranges:
`vcluster create my-service-cluster --namespace team-x --service-cidr 10.96.0.0/12`{{exec}}

Network optimization ensures that vClusters have good connectivity while maintaining isolation between tenants.