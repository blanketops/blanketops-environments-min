#!/bin/ash

echo "Deleting all AWS AutoScaling Resources----"

kubectl delete launchconfiguration.autoscaling.aws.upbound.io --all
kubectl delete autoscalinggroup.autoscaling.aws.upbound.io --all
kubectl delete grouptag.autoscaling.aws.upbound.io --all
kubectl delete lifecyclehook.autoscaling.aws.upbound.io --all
kubectl delete policy.autoscaling.aws.upbound.io --all
kubectl delete notification.autoscaling.aws.upbound.io --all
kubectl delete schedule.autoscaling.aws.upbound.io --all

echo "---Complete!!"