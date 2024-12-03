#!/bin/ash
echo "---Applying all AWS Required Providers for BlanketOps"
pwd
cd providers
kubectl apply -f terraform
kubectl apply -f aws/aws_s3.yaml
kubectl apply -f azure
kubectl apply -f helm

echo "Complete!!---"