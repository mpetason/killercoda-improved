# Advanced vCluster Configuration

In this step, we'll explore advanced configuration options for vClusters.

The vCluster CLI provides many flags and configuration options that allow you to customize your virtual cluster behavior. Let's look at some of the key configuration options:

`vcluster create my-advanced-cluster --namespace team-x --kube-config /path/to/config --sync-all --disable-sync --log-level debug`{{exec}}

This command shows several advanced options:
- `--namespace` - Specifies the host cluster namespace where the vCluster will be created
- `--kube-config` - Specifies a custom kubeconfig file
- `--sync-all` - Syncs all resources (default behavior)
- `--disable-sync` - Disables syncing of certain resources
- `--log-level debug` - Sets the logging level to debug

Let's check the current vCluster configuration:
`vcluster list`{{exec}}

You can also get more detailed information about a specific vCluster:
`vcluster get my-advanced-cluster -n team-x`{{exec}}