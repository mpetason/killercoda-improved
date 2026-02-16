# vCluster 106: Advanced Security and RBAC Configurations

## Scenario Overview

This scenario explores advanced security configurations and RBAC management for vClusters, building on the foundation established in previous scenarios. You'll learn how to implement fine-grained access controls, configure security policies, and manage authentication mechanisms for production-grade vCluster deployments.

## What You'll Learn

- Custom RBAC rule configurations
- Security policy enforcement in vClusters
- Service account management and security
- Advanced authentication and authorization
- Compliance and audit configurations
- Pod security context configurations
- API server security hardening

## Prerequisites

- Completed vCluster 101-105 scenarios
- Kubernetes cluster with kubectl access
- vCluster CLI installed
- Basic understanding of Kubernetes RBAC and security concepts

## Step 1: Configure Custom RBAC Rules

In this step, you'll learn how to add custom RBAC rules to vClusters beyond the default permissions.

### Create a vCluster with Custom RBAC Configuration

First, create a `vcluster.yaml` file with custom RBAC rules:

```yaml
rbac:
  role:
    enabled: true
    extraRules:
      - apiGroups: [""]
        resources: ["pods/status", "pods/ephemeralcontainers"]
        verbs: ["patch", "update"]
      - apiGroups: ["apps"]
        resources: ["deployments"]
        verbs: ["get", "list", "watch"]
      - apiGroups: ["batch"]
        resources: ["jobs"]
        verbs: ["create", "delete"]
```

### Deploy the vCluster with Custom RBAC

```bash
vcluster create my-secure-vcluster -f vcluster.yaml --connect=false
```

### Verify Custom RBAC Rules

Connect to your vCluster and verify the custom rules are applied:

```bash
vcluster connect my-secure-vcluster
kubectl get roles
kubectl get rolebindings
```

## Step 2: Implement Pod Security Contexts

In this step, you'll configure advanced pod security contexts to enforce security policies.

### Create a vCluster with Security Context Configuration

Create a `security-config.yaml` file with pod security configurations:

```yaml
policies:
  podSecurityStandard: restricted

controlPlane:
  distro:
    k8s:
      enabled: true
      apiServer:
        extraArgs:
        - --anonymous-auth=false
        - --enable-admission-plugins=DenyServiceExternalIPs
```

### Deploy the vCluster with Security Contexts

```bash
vcluster create secure-vcluster -f security-config.yaml --connect=false
```

### Verify Security Context Configuration

Connect to your vCluster and verify the security settings:

```bash
vcluster connect secure-vcluster
kubectl get pods -A
```

## Step 3: Configure Advanced Service Account Management

In this step, you'll learn how to manage service accounts with enhanced security.

### Create a vCluster with Custom Service Account

Create a `service-account.yaml` file:

```yaml
controlPlane:
  advanced:
    serviceAccount:
      name: custom-vc-sa
rbac:
  role:
    enabled: false
  clusterRole:
    enabled: false
```

### Deploy with Custom Service Account

```bash
vcluster create sa-secure-vcluster -f service-account.yaml --connect=false
```

### Verify Service Account Configuration

Connect to your vCluster and verify the service account:

```bash
vcluster connect sa-secure-vcluster
kubectl get serviceaccounts
```

## Step 4: Implement Security Policy Enforcement

In this final step, you'll enforce comprehensive security policies.

### Create a vCluster with Full Security Configuration

Create a `full-security.yaml` file:

```yaml
policies:
  podSecurityStandard: baseline
  networkPolicy:
    enabled: true

controlPlane:
  distro:
    k8s:
      enabled: true
      apiServer:
        extraArgs:
        - --anonymous-auth=false
        - --enable-admission-plugins=DenyServiceExternalIPs

rbac:
  role:
    enabled: true
    extraRules:
      - apiGroups: [""]
        resources: ["secrets"]
        verbs: ["get", "list"]
      - apiGroups: ["batch"]
        resources: ["cronjobs"]
        verbs: ["create", "delete"]
```

### Deploy with Full Security Configuration

```bash
vcluster create full-secure-vcluster -f full-security.yaml --connect=false
```

### Test Security Policies

Connect to your vCluster and test the security policies:

```bash
vcluster connect full-secure-vcluster
# Test that you can't create resources without proper permissions
kubectl create deployment test-deployment --image=nginx
```

## Conclusion

In this scenario, you've learned how to implement advanced security configurations and RBAC management for vClusters. You've covered:

1. Custom RBAC rule configurations
2. Pod security context configurations
3. Service account management
4. API server security hardening
5. Comprehensive security policy enforcement

These advanced security configurations are essential for production vCluster deployments where compliance, audit requirements, and security best practices are critical.

## Next Steps

After completing this scenario, you can explore:
- vCluster 107: Integration with Identity and Access Management (IAM) systems
- vCluster 108: Advanced monitoring and observability for security