#!/bin/ash

echo "Deleting all AWS AutoScalingPlans Resources----"
kubectl delete scalingplan.autoscalingplans.aws.upbound.io --all
echo "---Complete!!"