#!/usr/bin/env sh
set -e

kubectl apply -f - <<EOF
apiVersion: v1
kind: Namespace
metadata:
  name: $NS
EOF

kubectl create secret generic rabbitmq-secrets --from-literal=rabbitmq-password=rabbitmq-admin --from-literal=rabbitmq-cookie=rabbitmq-cookie -n $NS

helm install rabbitmq oci://registry-1.docker.io/cloudpirates/rabbitmq --version 0.7.9 --namespace $NS --create-namespace -f values.yaml --set ingress.hosts[0].host="rabbitmq.$DOMAIN"

# helm upgrade rabbitmq oci://registry-1.docker.io/cloudpirates/rabbitmq --install --namespace $NS --create-namespace -f values.yaml --set ingress.hosts[0].host="rabbitmq.$DOMAIN"
