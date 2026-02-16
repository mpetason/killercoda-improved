# Configuring External Secrets Operator

In this step, we'll configure External Secrets Operator to work with our vCluster.

Let's create an ExternalSecret that will sync secrets from an external store:

```yaml
# external-secret.yaml - ExternalSecret configuration
apiVersion: external-secrets.io/v1beta1
kind: ExternalSecret
metadata:
  name: db-secret
spec:
  secretStoreRef:
    name: aws-secret-store
    kind: ClusterSecretStore
  target:
    name: db-secret
  data:
  - secretKey: username
    remoteRef:
      key: myapp/db/username
  - secretKey: password
    remoteRef:
      key: myapp/db/password
```

And let's create a SecretStore that defines our external secret source:

```yaml
# secret-store.yaml - SecretStore configuration for AWS
apiVersion: external-secrets.io/v1beta1
kind: ClusterSecretStore
metadata:
  name: aws-secret-store
spec:
  provider:
    aws:
      service: SecretsManager
      region: us-east-1
      auth:
        secretRef:
          accessKeyIDSecretRef:
            name: aws-credentials
            key: access-key-id
          secretAccessKeySecretRef:
            name: aws-credentials
            key: secret-access-key
---
# aws-credentials.yaml - AWS credentials secret
apiVersion: v1
kind: Secret
metadata:
  name: aws-credentials
type: Opaque
data:
  access-key-id: <base64-encoded-access-key>
  secret-access-key: <base64-encoded-secret-key>
```

Let's also create a basic configuration for a HashiCorp Vault integration:

```yaml
# vault-secret-store.yaml - SecretStore configuration for Vault
apiVersion: external-secrets.io/v1beta1
kind: ClusterSecretStore
metadata:
  name: vault-secret-store
spec:
  provider:
    vault:
      server: https://vault.example.com
      path: secret
      version: v2
      auth:
        token:
          secretRef:
            name: vault-token
            key: token
---
# vault-token.yaml - Vault token secret
apiVersion: v1
kind: Secret
metadata:
  name: vault-token
type: Opaque
data:
  token: <base64-encoded-vault-token>
```

These configurations will:
1. Create ExternalSecrets that pull from external stores
2. Set up ClusterSecretStore configurations for AWS and Vault
3. Provide the necessary credentials for accessing external secret stores
4. Define how secrets should be mapped to Kubernetes secrets