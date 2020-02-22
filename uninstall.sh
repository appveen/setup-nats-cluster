#!/bin/sh
echo "********Uninstalling NATS Cluster On K8S********"
read -p "Enter Kubernetes Namespace : " namespace
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
kubectl delete -f nats-$namespace.yaml
kubectl delete -f deployment-$namespace.yaml
kubectl delete -f default-rbac-$namespace.yaml
kubectl delete -f 10-deployment-$namespace.yaml
kubectl delete -f 00-prereqs-$namespace.yaml
kubectl delete natscluster --all -n $namespace
rm 00-prereqs-$namespace.yaml
rm 10-deployment-$namespace.yaml 
rm default-rbac-$namespace.yaml
rm deployment-$namespace.yaml
rm nats-$namespace.yaml
echo "********NATS Cluster Uninstalled On K8S*********"