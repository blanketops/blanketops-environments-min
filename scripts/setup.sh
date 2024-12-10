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

function_health_check_knative_operator(){
   echo "---------------------------------------------------------"
   echo "HealthCheck KNative Resources Installation"
   echo "---------------------------------------------------------"
   # kubectl config set-context --current --namespace=default 
   # kubectl get all -n knative-operator
   # sleep 5
   # clear
   # kubectl get all -n  knative-serving
   # #kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.16.0/serving-default-domain.yaml
   # kubectl get KnativeServing knative-serving -n knative-serving
   # sleep 3
   # clear
   # kubectl patch configmap/config-domain --namespace knative-serving --type merge --patch '{"data":{"example.com":""}}'
   # sleep 3
   # kubectl get ksvc
   # sleep 3
   # kubectl --namespace knative-serving get service kourier
   # #kubectl logs -f deploy/knative-operator -n knative-operator
   # kubectl get KnativeEventing knative-eventing -n knative-eventing

  

   sleep 60
   kubectl -n knative-sources get pods --selector control-plane=github-controller-manager

   sleep 10
   kubectl --namespace default apply --filename github/github_service.yaml

   sleep 10
   kubectl --namespace default apply --filename secrets/github_secret.yaml

   sleep 10
   kubectl --namespace default apply --filename github/github_source.yaml

   echo "---------------------------------------------------------"
   sleep 10
   clear
}


function_setup_metallb(){
  echo "-------------------------------------"
  echo "SetUp Metallb Resources"
  echo "---------------------------------------------------------"
  pwd
  kubectl apply -f metallb/address_pool.yaml
  kubectl apply -f metallb/l2_advertisement.yaml
  kubectl apply -f metallb/lb_test.yaml
  sleep 30

#   export LB_IP=$(kubectl get svc/foo-service -o=jsonpath='{.status.loadBalancer.ingress[0].ip}')
#   echo $LB_IP
#   # should output foo and bar on separate lines 
#   for _ in {1..10}; do
#     curl ${LB_IP}:5678
#     sleep 5
#   done
  echo "---------------------------------------------------------"
  clear
}


function_setup_kourier(){
   echo "---------------------------------------------------------"
   echo "SetUp Kourier and Components"
   echo "---------------------------------------------------------"
   sleep 10
   kubectl patch configmap/config-network -n knative-serving --type merge -p '{"data":{"ingress.class":"kourier.ingress.networking.knative.dev"}}'
   sleep 10
   kubectl create secret tls ${CERT_NAME} --key ${KEY_FILE} --cert ${CERT_FILE}
   sleep 15
   kubectl -n "knative-serving" patch configmap/config-kourier --type merge -p '{"data":{"cipher-suites":"ECDHE-ECDSA-AES128-GCM-SHA256,ECDHE-ECDSA-CHACHA20-POLY1305"}}'
   kubectl patch configmap/config-kourier -n knative-serving --type merge -p '{"data":{"enable-proxy-protocol":"true"}}'
   kubectl get configmap config-kourier --namespace knative-serving --output yaml
   sleep 10
   clear
   kubectl patch configmap/config-domain -n knative-serving --type merge -p '{"data":{"ec2-13-61-123-118.eu-north-1.compute.amazonaws.com":""}}'
   echo "---------------------------------------------------------"
   sleep 10
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

# sleep 600
function_setup_metallb
# sleep 10
# function_setup_kourier
# function_setup_crossplane
# function_install_terraform_components
#function_health_check_knative_operator
# function_health_check_terraform_components