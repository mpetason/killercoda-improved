# Inspect the Host Cluster

It's time to disconnect from the vCluster and see what resources are created on the Host Cluster.

`vcluster disconnect`{{exec}}

List the namespaces so that we can find where our vCluster pods are running.

`kubectl get namespaces`{{exec}}

We can see the `team-x` namespace, which is the namespace we used to create the vCluster.

What about if we want to see the deployment? The deployment only exists in the vCluster, the resources created by the deployment (pods) will exist on the host cluster. If we run this command we will not actually see the deployment:

`kubectl get deployment -n team-x`{{exec}}

We can see the resources that are created by it, such as the Pod.

`kubectl get pods -n team-x`{{exec}}

If we list everything in the namespace we can see some of the resources that back the vCluster.

`kubectl get all -n team-x`{{exec}}
