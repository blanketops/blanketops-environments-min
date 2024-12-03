#!/bin/ash

echo "Deleting all AWS ACM Resources----"

kubectl delete certificate.acm.aws.upbound.io --all
kubectl delete certificatevalidation.acm.aws.upbound.io --all

echo "---Complete!!"