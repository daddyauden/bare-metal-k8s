# 🚀 Bare-Metal Kubernetes Cluster with kubeadm on Ubuntu

Complete Platform for Development, DevOps & Observability (**Includes full installation scripts**)

This repository provides a full guide and reference architecture for setting up a production-ready Kubernetes cluster on bare-metal Ubuntu servers using kubeadm. It also includes a full ecosystem of development and DevOps tooling—CI/CD, observability, message queues, storage, GitOps, monitoring, and more.

## Overview

This repository provides a complete guide and automation scripts for provisioning a bare-metal Kubernetes cluster on Ubuntu using kubeadm, along with a full suite of Dev/DevOps platforms:

* GitOps: ArgoCD

* CI/CD + VCS: Jenkins, GitLab

* Container registry: Harbor

* Message Queue: RabbitMQ

* Databases / Cache: PostgreSQL, Redis

* Object storage: MinIO

* API Gateway / Ingress: Traefik or NGINX Ingress

* Monitoring: Prometheus, Grafana

* Tracing & Telemetry: OpenTelemetry

* Logging (optional): Loki

## K8S Cluster Architecture

| Component | Count | Notes |
|----------|----------|----------|
| Control Plane Nodes | 1-3 | kube-apiserver, etcd, controller-manager, scheduler |
| Worker Nodes | 2-N | Run workloads with all the listing services |
| Networking | Calico | CNI, IpTables or eBPF |
| Storage | Rook & Ceph | Persistent volumes for services |

## Prerequisites

 * Ubuntu Server 22.04/24.04 (all nodes)

 * 3+ nodes with:

    * 2+ CPUs

    * 8+ GB RAM minimum

    * 100+ GB disk(each worker node equires one or more raw, dedicated disks for ceph)

## Repository Structure
* install: all installation scripts with steps
    * 1-prepare-all-node.sh: install all the necessary packages in all nodes to prepare for Kubernetes installation.
    * 2-1-init-master-control-plane.sh: install k8s in master node
    * 2-2-kubectl-master-control-plane.sh: setup kubectl autocomplete in profile and install helm
    * 2-3-calico-master-control-plane.sh: install calico networking with iptables filter
    * 3-join-control-plane.sh: other control plane node join
    * 4-join-worker.sh: worker node join
    * 5-reset-worker.sh: reset environment and uninstall all packages in worker node
    * 6-reset-master-control-plane.sh: reset environment and uninstall all packages in control plane node

* pem: crt and key file certificate for k8s

* services: all services includes develop, devops and observability

* tf: Terraform configuration files (in progress)