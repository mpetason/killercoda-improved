# Deploy a vCluster

Before we deploy the vCluster let's take a look at the namespaces and CRDs on the host cluster. Since a vCluster creates a new virtual kubernetes cluster, we're going to get a brand new API endpoint with a database backing it. This means that we will have different namespaces, CRDs, and other resources that are not 1:1 with the host cluster.

`kubectl get crds`{{exec}}

`kubectl get namespaces`{{exec}}

Now we will deploy a vCluster. We are going to use `vcluster create` and specify the name of the vCluster and the namespace where we want to deploy it. For each vCluster you will need a namespace on the host cluster.

`vcluster create my-vcluster --namespace team-x`{{exec}}

After the command finishes, and the vCluster is available, we will be automatically connected to it. This demo environment has Docker installed which will spin up a proxy container so that we can connect to the cluster.
