# Developer Sandbox Environments

In this step, we'll look at how vClusters can be used to create developer sandbox environments.

Developers can benefit from having their own isolated environments where they can experiment without affecting other teams:

`vcluster create dev-sandbox --namespace developers --connect=false`{{exec}}

Let's create a simple deployment in this sandbox:
`kubectl create deployment nginx --image=nginx -n developers`{{exec}}

We can then expose this deployment:
`kubectl expose deployment nginx --port=80 -n developers`{{exec}}

To access the sandbox environment:
`kubectl port-forward service/nginx 8080:80 -n developers`{{exec}}

Developer sandboxes provide:
- Isolated environments for experimentation
- No risk of affecting other teams
- Easy to create and destroy
- Cost-effective compared to separate physical clusters

This approach is particularly valuable for teams that want to provide self-service access to Kubernetes while maintaining control.