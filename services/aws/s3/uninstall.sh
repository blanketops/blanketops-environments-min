#!/bin/ash


echo "Deleting all AWS ECS Resources----"
kubectl delete bucket.s3.aws.upbound.io --all 
echo "---Complete!!"