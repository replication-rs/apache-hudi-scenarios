#!/usr/bin/env sh

if ! [ -x "$(command -v docker)" ]; then
  echo 'Error: docker is not installed.' >&2
  exit 1
fi

mkdir -p bin
curl -Lo bin/kubectl "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl" && chmod +x bin/kubectl
curl -Lo bin/kind "https://kind.sigs.k8s.io/dl/v0.11.1/kind-darwin-amd64" && chmod +x bin/kind

./bin/kind create cluster --image kindest/node:v1.23.3 --config setup/kind.yaml
./bin/kubectl apply -k kustomize/hudi
