#!/bin/sh
echo "Setting NATS Streaming cluster"
read -p "Enter the namespace : " namespace
cp cluster-nats.yaml cluster-nats-$namespace.yaml
cp cluster-stan.yaml cluster-stan-$namespace.yaml
sed -i "s/__namespace__/$namespace/" cluster-nats-$namespace.yaml
sed -i "s/__namespace__/$namespace/" cluster-stan-$namespace.yaml
kubectl create -f cluster-nats-$namespace.yaml
kubectl create -f cluster-stan-$namespace.yaml