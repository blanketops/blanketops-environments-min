#!/bin/ash

echo "Deleting all AWS ECS Resources----"

kubectl delete capacityprovider.ecs.aws.upbound.io --all 
kubectl delete cluster.ecs.aws.upbound.io --all 
kubectl delete clustercapacityproviders.ecs.aws.upbound.io --all 
kubectl delete service.ecs.aws.upbound.io --all 
kubectl delete taskdefinition.ecs.aws.upbound.io --all 


echo "---Complete!!"