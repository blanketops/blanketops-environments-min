#!/bin/bash

function_initialize(){
   function_initialize_required_secrets
}

function_setup(){
   function_setup_kourier
   function_setup_knative_github_sources
   function_setup_eventing
   function_setup_metallb
}

function_health_check(){
  function_health_check_crossplane
}

function_connect(){
  function_connect_to_crossplane_providers
  sleep 360
  function_connect_to_crossplane_providerconfigs
}

function_setup_eventing(){
   echo "---------------------------------------------------------"
   echo "Setting up Eventing"
   echo "---------------------------------------------------------"
   kubectl create ns devops
   kubectl apply -f manager/eventing/eventing_service_account.yaml
   kubectl apply -f manager/eventing/eventing_role.yaml
   kubectl apply -f manager/eventing/eventing_role_binding.yaml
   kubectl apply -f manager/eventing/eventing_deployment.yaml
   kubectl apply -f manager/eventing/eventing_service.yaml
   kn source apiserver create blanketopsapiserversource --namespace devops --mode "Resource" --resource "Event:v1" --service-account eventing-service-account --sink github-message-dumper
   kubectl run busybox --image=busybox --namespace=devops --restart=Never -- ls
   kubectl logs --namespace=devops -l app=github-message-dumper --tail=100
   echo "---------------------------------------------------------"
   echo "Complete!"
   echo "----------------------------------------------------------------------------------"
   echo "Waiting for Next Instructions!...."
   clear
}


function_boot_environments(){
  echo "-----------------------------------------------------------------------------------------------------------------------------------"
  echo "Booting Up Example Demonstration for A Microservices Development Environment, ideally running nginx web server displaying hello page"
  echo "The below commands will"
  echo "-----------------------------------------------------------------------------------------------------------------------------------"

  echo "1. Install ArgoCD Defined cluster and project", here argocd/argocd_cluster.yaml
  echo "2. Wait a little bit for resources to be in ready state"
  echo "3. Install The BlanketOps Environment Resource Definition", here environments/environments.batch.blanketops.co.za.yaml
  echo "4. Install the initial Patch and transform service/function containing our environment AWS Resources", here environments/services/patch_and_transform.yaml
  echo "5. Install our microservices development environment via argodcd", here argocd/environments/microservice/dev.yaml
  echo "6. Get our Argocd password for initial sign in"
  echo "7. Port Forward our argocd instance to port 8081"
  echo "8. Visit http://localhost:8081", enter argocd password from step 6, your environment shall sync to the desired state defined in kind=Environment from step 5
  sleep 30
  echo "-----------------------------------------------------------------------------------------------------------------------------------------------"
  kubectl apply -f services/argocd/argocd_cluster.yaml
  kubectl apply -f services/argocd/argocd_project.yaml
  sleep 120
  kubectl apply -f environments/environments.batch.blanketops.co.za.yaml
  kubectl apply -f environments/functions/patch_and_transform.yaml
  kubectl apply -f argocd/environments/microservice/dev.yaml
  argocd admin initial-password -n argocd
  kubectl port-forward svc/argocd-server -n argocd 8081:443

}


function_initialize_required_secrets(){
   echo "---------------------------------------------------------"
   echo "Installing AWS Crossplane Secret"
   echo "---------------------------------------------------------" 
   kubectl create secret generic aws-secret -n crossplane-system --from-file=creds=secrets/./aws-credentials.txt
   echo "---------------------------------------------------------"

   # echo "Installing LocalStack Secret"
   # echo "---------------------------------------------------------" 
   # kubectl create secret generic localstack-aws-secret -n crossplane-system --from-file=creds=secrets/./aws-credentials.txt
   # kubectl apply -f secrets/localstack_aws_secret.yaml
   # echo "---------------------------------------------------------"

   echo "Complete!"
   echo "----------------------------------------------------------------------------------"
   echo "Waiting for Next Instructions!...."
}


function_connect_to_crossplane_providers(){
   echo "---------------------------------------------------------" 
   echo "Connect Crossplane Base Providers"
   echo "---------------------------------------------------------"
   kubectl apply -f providers/terraform/terraform.yaml
   kubectl apply -f providers/aws/aws_s3.yaml
   kubectl apply -f providers/aws/aws_dynamodb.yaml
   kubectl apply -f providers/aws/aws_ecr.yaml
   kubectl apply -f providers/aws/aws_ecr_public.yaml
   kubectl apply -f providers/aws/aws_ecs.yaml
   kubectl apply -f providers/helm/helm.yaml
   kubectl apply -f providers/argocd/argocd.yaml
   kubectl apply -f providers/kubernetes/kubernetes.yaml

   echo "---------------------------------------------------------"
   echo "Complete!"
   echo "----------------------------------------------------------------------------------"
   echo "Waiting for Next Instructions!...."

}

function_connect_to_crossplane_providerconfigs(){
   echo "---------------------------------------------------------" 
   echo "Connect Base ProviderConfigs"
   echo "---------------------------------------------------------"
   kubectl apply -f providerconfigs/terraform.yaml
   #kubectl apply -f providerconfigs/localstack.yaml
   kubectl apply -f providerconfigs/aws.yaml
   kubectl apply -f providerconfigs/argocd.yaml
   kubectl apply -f providerconfigs/helm.yaml
   kubectl apply -f providersconfigs/kubernetes.yaml
   echo "---------------------------------------------------------"
   echo "Complete!"
   echo "----------------------------------------------------------------------------------"
   echo "Waiting for Next Instructions!...."
}


function_health_check_crossplane(){
   echo "---------------------------------------------------------"
   echo "HealthCheck Crossplane Installation"
   echo "---------------------------------------------------------"
   kubectl get pod --namespace crossplane-system
   clear
   kubectl api-resources  | grep crossplane
   echo "---------------------------------------------------------"
   echo "Complete!"
   echo "----------------------------------------------------------------------------------"
   echo "Waiting for Next Instructions!...."
   clear
}

function_setup_knative_github_sources(){
   echo "---------------------------------------------------------"
   echo "HealthCheck KNative Github Resources Installation"
   echo "---------------------------------------------------------" 
   sleep 60
   kubectl -n knative-sources get pods --selector control-plane=github-controller-manager
   sleep 10
   kubectl --namespace default apply --filename manager/resources/github_service.yaml
   sleep 10
   kubectl --namespace default apply --filename secrets/github_secret.yaml
   sleep 10
   kubectl --namespace default apply --filename manager/resources/github_source.yaml
   echo "---------------------------------------------------------"
   sleep 10
   echo "Complete!"
   echo "----------------------------------------------------------------------------------"
   echo "Waiting for Next Instructions!...."
   clear
}


function_setup_metallb(){
  echo "-------------------------------------"
  echo "SetUp Metallb Resources"
  echo "---------------------------------------------------------"
  pwd
  kubectl apply -f bare_metal_loadbalancer/address_pool.yaml
  kubectl apply -f bare_metal_loadbalancer/l2_advertisement.yaml
  kubectl apply -f bare_metal_loadbalancer/lb_test.yaml
  sleep 30
  echo "---------------------------------------------------------"
  echo "Complete!"
  echo "----------------------------------------------------------------------------------"
  echo "Waiting for Next Instructions!...."
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
   echo "Complete!"
   echo "----------------------------------------------------------------------------------"
   echo "Waiting for Next Instructions!...."
   sleep 10
   clear

}

function_setup_localstack(){
   echo "---------------------------------------------------------"
   echo "Setting up LocalStack"
   echo "---------------------------------------------------------"
   export NODE_PORT=$(kubectl get --namespace "localstack" -o jsonpath="{.spec.ports[0].nodePort}" services localstack)
   export NODE_IP=$(kubectl get nodes --namespace "localstack" -o jsonpath="{.items[0].status.addresses[0].address}")
   echo http://$NODE_IP:$NODE_PORT
   echo "---------------------------------------------------------"
   echo "Complete!"
   echo "----------------------------------------------------------------------------------"
   echo "Waiting for Next Instructions!...."
   clear
}

function_initialize
sleep 360
function_connect
function_health_check
sleep 10
function_boot_environments

