# Step 3 — Inspect the vCluster

Now that the vCluster has been created and we are connected we can take a look at the current context we are using.

`kubectx`{{exec}}

We are now using the `vcluster_my-vcluster_team-x_kubernetes-admin@kubernetes` context.

Then we can take a look at the CRDs and Namespaces that exist in the vCluster.

`kubectl get crd`{{exec}}

`kubectl get namespaces`{{exec}}

Notice how they do not match the Host Cluster results. This is because the vCluster has created a new API and Database and does not contain the same resources as the Host Cluster. This subtle difference is what makes vCluster so powerful. We will get into what you can do with this in more advanced scenarios. The basic idea is that you can install different CRDs in the vCluster or even run a completely different version of Kubernetes.

We can also list the virtual clusters that have been created.

`vcluster list`{{exec}}
