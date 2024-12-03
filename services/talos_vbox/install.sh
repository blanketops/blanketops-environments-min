#!/bin/sh

export CONTROL_PLANE_IP=192.168.0.107
export WORKER_IP=192.168.0.193
export WORKER_IP1=192.168.0.110
export WIREGUARD_NODE=192.168.0.110
export TALOSCONFIG="_out/talosconfig"
talosctl gen config talos-vbox-cluster https://$CONTROL_PLANE_IP:6443 --output-dir _out
talosctl apply-config --insecure --nodes $CONTROL_PLANE_IP --file _out/controlplane.yaml
talosctl apply-config --insecure --nodes $WORKER_IP --file _out/worker.yaml
talosctl config endpoint $CONTROL_PLANE_IP
talosctl config node $CONTROL_PLANE_IP
talosctl --talosconfig $TALOSCONFIG config endpoint $CONTROL_PLANE_IP
talosctl --talosconfig $TALOSCONFIG config node $CONTROL_PLANE_IP
talosctl --talosconfig $TALOSCONFIG kubeconfig .
rm -rf .kube/config
cp -r kubeconfig .kube/config

## Do not starve the controller manager resources, workers can die at anytime
