#!/bin/bash

# Get all node names and their roles
nodes=$(kubectl get nodes --no-headers -o custom-columns=":metadata.name,:metadata.labels['kubernetes\\.io/role']")

# Loop through each node
echo "$nodes" | while read -r node role; do
  if [[ "$role" != "control-plane" ]]; then
    echo "Labeling node: $node"
    kubectl label node "$node" node-role.kubernetes.io/worker=worker --overwrite
  fi
done
