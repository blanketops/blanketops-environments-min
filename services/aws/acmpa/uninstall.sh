#!/bin/ash

echo "Deleting all AWS ACMPA Resources----"

kubectl delete certificate.acmpca.aws.upbound.io --all
kubectl delete certificateauthority.acmpca.aws.upbound.io --all
kubectl delete permission.acmpca.aws.upbound.io --all
kubectl delete policy.acmpca.aws.upbound.io --all
kubectl delete notification.acmpca.aws.upbound.io --all

echo "---Complete!!"