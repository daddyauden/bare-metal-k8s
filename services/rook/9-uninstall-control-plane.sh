#!/usr/bin/env sh
set -e

cd ./github/rook/deploy/examples

NS=rook-ceph

kubectl get crd --no-headers -o custom-columns=":metadata.name" | grep 'rook.io$' | xargs -I {} kubectl delete crd {}

kubectl -n $NS patch cephcluster rook-ceph --type merge -p '{"spec":{"cleanupPolicy":{"confirmation":"yes-really-destroy-data"}}}'

kubectl -n $NS delete cephcluster rook-ceph

# kubectl delete -f csi/rbd/storageclass.yaml

# kubectl delete -f csi/cephfs/storageclass.yaml

# kubectl delete -f filesystem.yaml

# kubectl delete -f object.yaml

kubectl delete -f cluster-test.yaml
kubectl delete -f crds.yaml -f common.yaml -f csi-operator.yaml -f operator.yaml
kubectl delete ns $NS
