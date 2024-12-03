#!/bin/ash

echo "Deleting all AWS ImageBuilder Resources----"

kubectl delete component.imagebuilder.aws.upbound.io --all 
kubectl delete containerrecipe.imagebuilder.aws.upbound.io --all 
kubectl delete distributionconfiguration.imagebuilder.aws.upbound.io --all 
kubectl delete imagepipeline.imagebuilder.aws.upbound.io --all 
kubectl delete imagerecipe.imagebuilder.aws.upbound.io --all 

kubectl delete image.imagebuilder.aws.upbound.io --all 
kubectl delete infrastructureconfiguration.imagebuilder.aws.upbound.io --all 

echo "---Complete!!"