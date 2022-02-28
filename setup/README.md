# Setup

We need a Kubernetes environment to run the scenarios.

And Kubernetes CLI setup to access the cluster. https://kubernetes.io/docs/tasks/tools/#kubectl

**Note**: Tutorials need cluster level access, so recommended way is running on a local cluster.

## Create a local Kubernetes cluster

Below shown examples using [kind](https://kind.sigs.k8s.io/) and [minikube](https://minikube.sigs.k8s.io/docs/)

**Note**: Allocate at-least 4 CPU and 8GB memory to the cluster for better experience.

Example: https://docs.docker.com/desktop/mac/#resources

### Install docker

https://docs.docker.com/get-docker/

### Install kind or minikube

https://kind.sigs.k8s.io/docs/user/quick-start/#installation

https://minikube.sigs.k8s.io/docs/start/

### Examples to create cluster using kind/minikube(macOS)

```shell
kind create cluster --image kindest/node:v1.23.3 --config setup/kind.yaml
```

```shell
minikube start --cpus='4' --memory='8g' --kubernetes-version=v1.23.3 --driver=docker
```

## Run required services

Run the provided [Kustomize](https://kustomize.io/) manifests to run required services. This will install the following
services on the cluster. As more scenarios are developed, required services will be added here.

1. [minio](https://github.com/minio/minio)
2. [hudi-operator](https://github.com/h7kanna/hudi-operator)
3. [spark](https://spark.apache.org/docs/latest/running-on-kubernetes.html)

```shell
kubectl apply -k kustomize/hudi
```

## Cleanup

Kind

```shell
kind delete cluster
```

Minikube

```shell
minikube delete
```

# Appendix

Below is the list of container images that will be run on the cluster. As more scenarios are developed, required images
will be added here.

1. Apache Hudi operator - h7kanna/hudi-operator:latest
2. Apache Hudi deltastreamer - h7kanna/apache-hudi-deltastreamer:v0.10.1
3. Apache Hudi Spark bundle - h7kanna/hudi-spark3.1.2-bundle:v0.10.1
4. Apache Spark - h7kanna/spark:v3.1.2
5. Minio - minio/minio:RELEASE.2022-02-07T08-17-33Z
6. RBAC proxy - gcr.io/kubebuilder/kube-rbac-proxy:v0.8.0
7. Postgres - postgres:13-alpine
8. Temporal server - h7kanna/temporal-server:v1.14.5
9. Temporal tools - h7kanna/temporal-sql-tool:v1.14.5
10. Busybox - busybox:1.28

### Build instructions

TODO