#!/bin/ash

echo "Deleting all AWS CloudFront Resources----"

kubectl delete cachepolicy.cloudfront.aws.upbound.io --all
kubectl delete distribution.cloudfront.aws.upbound.io --all
kubectl delete fieldlevelencryptionconfig.cloudfront.aws.upbound.io --all
kubectl delete fieldlevelencryptionprofile.cloudfront.aws.upbound.io --all
kubectl delete function.cloudfront.aws.upbound.io --all
kubectl delete keygroup.cloudfront.aws.upbound.io --all
kubectl delete monitoringsubscription.cloudfront.aws.upbound.io --all
kubectl delete originaccesscontrol.cloudfront.aws.upbound.io --all
kubectl delete originaccesscontrolidentity.cloudfront.aws.upbound.io --all
kubectl delete originaccesscontrolrequestpolicy.cloudfront.aws.upbound.io --all
kubectl delete publickey.cloudfront.aws.upbound.io --all
kubectl delete realtimelogconfig.cloudfront.aws.upbound.io --all
kubectl delete responseheaderspolicy.cloudfront.aws.upbound.io --all


echo "---Complete!!"