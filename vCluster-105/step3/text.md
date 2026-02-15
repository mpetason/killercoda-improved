# Testing and Staging Environments

In this step, we'll explore how to use vClusters for testing and staging environments.

vClusters are excellent for creating isolated testing environments that can closely mimic production:

`vcluster create staging-env --namespace staging --sync-namespace-annotations`{{exec}}

Let's deploy a sample application to the staging environment:
`kubectl create deployment myapp --image=nginx:alpine -n staging`{{exec}}

We can scale the deployment:
`kubectl scale deployment myapp --replicas=3 -n staging`{{exec}}

For testing purposes, we can also set up monitoring:
`kubectl apply -f https://raw.githubusercontent.com/loft-sh/vcluster/main/docs/monitoring/prometheus.yaml -n staging`{{exec}}

Testing environments created with vClusters:
- Are isolated from production
- Can run different versions of applications
- Are easy to spin up and tear down
- Provide consistent testing conditions

This approach is particularly useful for teams that need to test multiple versions of their applications.