#!/bin/ash

echo "Deleting all AWS Inspector Resources----"

kubectl delete assessmenttarget.inspector.aws.upbound.io --all 
kubectl delete assessmenttemplate.inspector.aws.upbound.io --all 
kubectl delete resorcegroup.inspector.aws.upbound.io --all 

echo "---Complete!!"