# Hello Hudi

This is an introduction scenario.

Please [setup](../setup/README.md) a Kubernetes environment before running this scenario

```shell
kubectl config set-context --current --namespace=spark-system
```

```shell
cd hello-hudi
```

## Create table

```shell
kubectl apply -f huditable.yaml
```

## Check resources created for the table

```shell
kubectl get pods -n spark-system -w
```

## Run Apache Spark query

```shell
kubectl apply -f hudisparkquery.yaml
```

## Check output of the query from the logs

```shell
export POD_NAME=`kubectl get pods -l spark-role=driver -n spark-system | grep hudisparkquery | awk '{print $1;}'`
```

```shell
kubectl logs $POD_NAME -n spark-system
```