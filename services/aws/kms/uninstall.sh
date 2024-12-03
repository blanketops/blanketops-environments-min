#!/bin/ash

echo "Deleting all AWS KMS Resources----"

kubectl delete alias.kms.aws.upbound.io --all 
kubectl delete ciphertext.kms.aws.upbound.io --all 
kubectl delete externalkey.kms.aws.upbound.io --all 
kubectl delete grant.kms.aws.upbound.io --all 
kubectl delete key.kms.aws.upbound.io --all 

kubectl delete replicaexternalkey.kms.aws.upbound.io --all 
kubectl delete replicakey.kms.aws.upbound.io --all 

echo "---Complete!!"