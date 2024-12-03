#!/bin/ash

echo "Deleting all AWS IAM Resources----"

kubectl delete instanceprofile.iam.aws.upbound.io --all 
kubectl delete role.iam.aws.upbound.io --all 

echo "---Complete!!"