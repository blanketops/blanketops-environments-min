#!/bin/ash

echo "---Applying all AWS CloudFormation Resources"
kubectl apply -f .
echo "Complete!!---"