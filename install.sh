#!/bin/sh
echo "********Installing NATS Cluster On K8S********"
read -p "Enter Kubernetes Namespace : " namespace
read -p "Enter Cluster Size : " size 
kubectl create ns $namespace
cp 00-prereqs.yaml 00-prereqs-$namespace.yaml
cp 10-deployment.yaml 10-deployment-$namespace.yaml 
cp default-rbac.yaml default-rbac-$namespace.yaml
cp deployment.yaml deployment-$namespace.yaml
cp nats.yaml nats-$namespace.yaml
sed -i "s/__NAMESPACE__/$namespace/" 00-prereqs-$namespace.yaml
sed -i "s/__NAMESPACE__/$namespace/" 10-deployment-$namespace.yaml
sed -i "s/__NAMESPACE__/$namespace/" default-rbac-$namespace.yaml
sed -i "s/__NAMESPACE__/$namespace/" deployment-$namespace.yaml
sed -i "s/__NAMESPACE__/$namespace/" nats-$namespace.yaml
sed -i "s/__SIZE__/$size/" nats-$namespace.yaml
kubectl create -f 00-prereqs-$namespace.yaml
kubectl create -f 10-deployment-$namespace.yaml
kubectl create -f default-rbac-$namespace.yaml
kubectl create -f deployment-$namespace.yaml
kubectl create -f nats-$namespace.yaml
rm 00-prereqs-$namespace.yaml
rm 10-deployment-$namespace.yaml 
rm default-rbac-$namespace.yaml
rm deployment-$namespace.yaml
rm nats-$namespace.yaml
echo "********NATS Cluster Installed On K8S*********"