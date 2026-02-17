# Step 4 — Create a Deployment

Next we will create an NGINX deployment in the vCluster.

`kubectl create deployment nginx --image=nginx`{{exec}}

This will create a new deployment, which we can see by running:

`kubectl get deployment`{{exec}}

Let's take a look at what pods are running.

`kubectl get pods`{{exec}}

We can describe the pod to get more information, such as Events. This is a quick way to see if there are any issues or troubleshoot pods that are in a non-running state.

`kubectl describe pod nginx`{{exec}}
