# Step 4 — Network Optimization

In this final step, we'll explore network optimization techniques for vClusters to ensure good connectivity while maintaining isolation.

Let's first check our current network configuration:
`kubectl get configmap -n team-x`{{exec}}

We can optimize network settings by specifying a custom network plugin:
`vcluster create my-advanced-cluster --namespace team-x --connect=false --upgrade --network-plugin cni`{{exec}}

This sets the network plugin to CNI for better network performance and compatibility.

We can also configure service CIDR ranges for better network organization:
`vcluster create my-advanced-cluster --namespace team-x --connect=false --upgrade --service-cidr 10.96.0.0/12`{{exec}}

Additionally, let's enable namespace annotation synchronization:
`vcluster create my-advanced-cluster --namespace team-x --connect=false --upgrade --sync-namespace-annotations`{{exec}}

These network optimization techniques help ensure that vClusters have good connectivity while maintaining proper isolation between tenants and optimizing resource usage.

Network optimization is particularly important in multi-tenant environments where different teams might have different networking requirements.