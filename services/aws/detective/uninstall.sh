#!/bin/ash

echo "Deleting all AWS Detective Resources----"

kubectl delete graph.detectiveplans.aws.upbound.io --all
kubectl delete invitationaccepter.detectiveplans.aws.upbound.io --all
kubectl delete member.detectiveplans.aws.upbound.io --all


echo "---Complete!!"