#!/bin/ash

echo "Deleting all AWS CodeCommit Resources----"
kubectl delete scalingplan.autoscalingplans.aws.upbound.io --all
echo "---Complete!!"