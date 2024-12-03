#!/bin/ash

echo "Deleting all AWS ECR Resources----"

kubectl delete lifecyclepolicy.ecr.aws.upbound.io --all 
kubectl delete pullthroughcacherule.ecr.aws.upbound.io --all 
kubectl delete registrypolicy.ecr.aws.upbound.io --all 
kubectl delete registryscanningconfiguration.ecr.aws.upbound.io --all  
kubectl delete repository.ecr.aws.upbound.io --all 
kubectl delete repositorypolicy.ecr.aws.upbound.io --all 
kubectl delete registryscanningconfiguration.ecr.aws.upbound.io --all 

echo "---Complete!!"