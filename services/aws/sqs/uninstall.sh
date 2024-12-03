#!/bin/ash

echo "Deleting all AWS SQS Resources----"
kubectl delete queue.sqs.aws.upbound.io --all 
kubectl delete queuepolicy.sqs.aws.upbound.io --all 
kubectl delete queueredriveallowpolicy.sqs.aws.upbound.io --all 
kubectl delete queueredrivepolicy.sqs.aws.upbound.io --all 
echo "---Complete!!"