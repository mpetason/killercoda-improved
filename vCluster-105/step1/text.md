# CI/CD Integration

In this step, we'll explore how to integrate vClusters with CI/CD pipelines.

vClusters are particularly useful for CI/CD environments where you want to test applications in isolated environments that mimic production:

`vcluster create test-env --namespace ci-cd --connect=false`{{exec}}

Let's set up a basic CI/CD workflow:
1. Create a vCluster for testing
2. Deploy application to the vCluster
3. Run tests
4. Clean up the vCluster

We can also configure vCluster to automatically scale based on demand:
`kubectl patch deployment vcluster-test-env -n ci-cd -p '{"spec":{"replicas":2}}'`{{exec}}

This creates a replica of the vCluster controller to handle more load.

Let's check the deployment status:
`kubectl get deployment vcluster-test-env -n ci-cd`{{exec}}

CI/CD integration allows teams to have isolated test environments without the overhead of managing separate physical clusters.