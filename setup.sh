#!/bin/bash

function_setup_crossplane(){
   function_install_aws_provider_providerconfig_with_bucket
}

function_install_aws_provider_providerconfig_with_bucket(){

   echo "Installing AWS Crossplane Secret"
   echo "---------------------------------------------------------" 
   kubectl create secret generic aws-secret -n crossplane-system --from-file=creds=secrets/./aws-credentials.txt
   echo "---------------------------------------------------------"
   

   echo "Connect AWS Crossplane Base Providers"
   echo "---------------------------------------------------------" 
   kubectl apply -f providers/aws/aws_s3.yaml
   kubectl apply -f providers/aws/aws_dynamodb.yaml
   kubectl apply -f providers/aws/aws_ecr.yaml
   kubectl apply -f providers/aws/aws_ecs.yaml
   echo "---------------------------------------------------------"
   

   echo "Connect AWS Crossplane ProviderConfig"
   echo "---------------------------------------------------------" 
   kubectl apply -f providerconfigs/aws.yaml
   echo "---------------------------------------------------------"
   

   echo "Create the Example Bucket"
   echo "---------------------------------------------------------" 
   kubectl apply -f services/aws/s3/s3_bucket.yaml
   echo "---------------------------------------------------------"
   
   clear

   echo "Check if Bucket is available"
   echo "---------------------------------------------------------" 
   kubectl describe buckets
   echo "---------------------------------------------------------"
   

   echo "teardown the bucket"
   echo "---------------------------------------------------------" 
   kubectl delete buckets --all
   echo "---------------------------------------------------------"
   
   clear
}

sleep 180
function_setup_crossplane