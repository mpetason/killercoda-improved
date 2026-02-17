# Configuration with vcluster.yaml

The `vcluster.yaml` file is the central configuration source for a vCluster. It controls everything from the control plane architecture to resource sync behavior.

If no `vcluster.yaml` is provided, vCluster applies defaults: embedded SQLite database, basic resource syncing (pods, services), and ClusterIP networking.

## Create a Custom Configuration

Let's create a `vcluster.yaml` that customizes our vCluster:

`cat <<'EOF' > /root/vcluster.yaml
sync:
  toHost:
    ingresses:
      enabled: true
  fromHost:
    nodes:
      enabled: true
EOF`{{exec}}

This configuration enables syncing ingresses from the vCluster to the host and syncing real node information into the vCluster.

## Create a vCluster with Custom Config

`vcluster create config-demo --namespace config-ns --values /root/vcluster.yaml`{{exec}}

Verify the vCluster is running:

`vcluster list`{{exec}}

You can see the nodes synced from the host cluster:

`kubectl get nodes`{{exec}}

With the default configuration, vCluster creates fake nodes. With `sync.fromHost.nodes.enabled: true`, real host node information is visible inside the vCluster.
