#!/bin/ash

echo "Deleting all AWS Route53 Resources----"

kubectl delete delegationset.route53.aws.upbound.io --all
kubectl delete healtcheck.route53.aws.upbound.io --alL
kubectl delete hostedzonesdnsec.route53.aws.upbound.io --all
kubectl delete record.route53.aws.upbound.io --all
kubectl delete resolverconfig.route53.aws.upbound.io --all

kubectl delete trafficpolicyinstance.route53.aws.upbound.io --all
kubectl delete trafficpolicy.route53.aws.upbound.io --alL
kubectl delete vpcassociationauthorization.route53.aws.upbound.io --all
kubectl delete vpczone.route53.aws.upbound.io --all
kubectl delete zone.route53.aws.upbound.io --all

echo "---Complete!!"