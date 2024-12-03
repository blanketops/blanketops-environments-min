#!/bin/bash

function_setup_crossplane(){
   sleep 120
   function_install_aws_provider_providerconfig_with_bucket
}


function_install_terraform_components(){
   echo "Installing Crossplane Terraform Provider"
   echo "---------------------------------------------------------"
   kubectl apply -f providers/terraform/terraform.yaml
   sleep 15
   echo "---------------------------------------------------------"

   echo "Creating Crossplane Terraform Secrets"
   echo "---------------------------------------------------------"
   kubectl create namespace upbound-system
   sleep 15
   echo "---------------------------------------------------------"

   echo "Creating Crossplane Terraform ProviderConfig"
   echo "---------------------------------------------------------"
   kubectl apply -f providerconfigs/terraform.yaml
   sleep 15
   echo "---------------------------------------------------------"
   clear
}


function_health_check_crossplane(){
   echo "---------------------------------------------------------"
   echo "HealthCheck Crossplane Installation"
   echo "---------------------------------------------------------"
   kubectl get pod --namespace crossplane-system
   clear
   kubectl api-resources  | grep crossplane
   echo "---------------------------------------------------------"
   clear
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
   
   sleep 180
   echo "Connect AWS Crossplane ProviderConfig"
   echo "---------------------------------------------------------" 
   kubectl apply -f providerconfigs/aws.yaml
   echo "---------------------------------------------------------"
   
   echo "Create the Example Bucket"
   echo "---------------------------------------------------------" 
   kubectl apply -f services/aws/s3/s3_bucket.yaml
   echo "---------------------------------------------------------"
   sleep 60
   clear

   echo "Check if Bucket is available"
   echo "---------------------------------------------------------" 
   kubectl describe buckets
   echo "---------------------------------------------------------"
   
   echo "Teardown the bucket"
   echo "---------------------------------------------------------" 
   kubectl delete buckets --all
   echo "---------------------------------------------------------"
   
   clear
}

sleep 180
function_setup_crossplane
function_install_terraform_components
# function_health_check_terraform_components