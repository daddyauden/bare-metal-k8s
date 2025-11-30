#!/usr/bin/env bash
set -e

kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.30.5/manifests/operator-crds.yaml
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.30.5/manifests/tigera-operator.yaml
curl -O https://raw.githubusercontent.com/projectcalico/calico/v3.30.5/manifests/custom-resources.yaml
sed -i 's/cidr: 192.168.0.0\/16/cidr: 20.20.0.0\/16/' custom-resources.yaml
kubectl create -f custom-resources.yaml
rm custom-resources.yaml

# # 3.31.2 with eBPF
# kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.31.2/manifests/operator-crds.yaml
# kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.31.2/manifests/tigera-operator.yaml
# curl -O https://raw.githubusercontent.com/projectcalico/calico/v3.31.2/manifests/custom-resources-bpf.yaml
# sed -i 's/cidr: 192.168.0.0\/16/cidr: 20.20.0.0\/16/' custom-resources-bpf.yaml
# kubectl create -f custom-resources-bpf.yaml
# rm custom-resources-bpf.yaml

# fix pod can not conmunicate svc, after remove kube-dns, k8s will recreate it
# kubectl delete pods -n kube-system -l k8s-app=kube-dns
