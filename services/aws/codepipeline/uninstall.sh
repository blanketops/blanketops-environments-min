#!/bin/ash

echo "Deleting all AWS CodePipeline Resources----"

kubectl delete codepipeline.codepipelineplans.aws.upbound.io --all
kubectl delete customactiontype.codepipelineplans.aws.upbound.io --all
kubectl delete webhook.codepipelineplans.aws.upbound.io --all

echo "---Complete!!"