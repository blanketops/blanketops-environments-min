#!/bin/ash

echo "Deleting all AWS Classic Loadbalancer Resources----"

kubectl delete attachment.loadbalancer.aws.upbound.io --all 
kubectl delete backendpolicy.loadbalancer.aws.upbound.io --all 
kubectl delete cookiestickynesspolicy.loadbalancer.aws.upbound.io --all 
kubectl delete elb.loadbalancer.aws.upbound.io --all 
kubectl delete lbsslnegotiationpolicy.loadbalancer.aws.upbound.io --all 

kubectl delete listernerpolicy.loadbalancer.aws.upbound.io --all 
kubectl delete policy.loadbalancer.aws.upbound.io --all 


echo "---Complete!!"