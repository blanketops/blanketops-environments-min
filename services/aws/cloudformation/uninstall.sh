#!/bin/ash

echo "Deleting all AWS CloudFormation Resources----"

kubectl delete stack.cloudformation.aws.upbound.io --all
kubectl delete stackset.cloudformation.aws.upbound.io --all
kubectl delete stacksetinstance.cloudformation.aws.upbound.io --all

echo "---Complete!!"