#!/bin/bash



function_initialize_required_secrets(){
   echo "---------------------------------------------------------"
   echo "Installing AWS Crossplane Secret"
   echo "---------------------------------------------------------" 
   kubectl create secret generic aws-secret -n crossplane-system --from-file=creds=secrets/./aws-credentials.txt
   echo "---------------------------------------------------------"

   echo "Installing LocalStack Secret"
   echo "---------------------------------------------------------" 
   kubectl create secret generic localstack-aws-secret -n crossplane-system --from-file=creds=secrets/./aws-credentials.txt
   #kubectl apply -f secrets/localstack_aws_secret.yaml
   echo "---------------------------------------------------------"
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

function_setup_knative_github_sources(){
   echo "---------------------------------------------------------"
   echo "HealthCheck KNative Github Resources Installation"
   echo "---------------------------------------------------------" 
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

function_setup_localstack(){
   echo "---------------------------------------------------------"
   echo "Setting up LocalStack"
   echo "---------------------------------------------------------"
   export NODE_PORT=$(kubectl get --namespace "localstack" -o jsonpath="{.spec.ports[0].nodePort}" services localstack)
   export NODE_IP=$(kubectl get nodes --namespace "localstack" -o jsonpath="{.items[0].status.addresses[0].address}")
   echo http://$NODE_IP:$NODE_PORT
   echo "---------------------------------------------------------"
   clear
}


function_initialize_required_secrets
function_connect_to_crossplane_providers
sleep 600
function_connect_to_crossplane_providerconfigs
function_setup_localstack
function_health_check_crossplane
sleep 120
k apply -f environments.batch.blanketops.co.za.yaml
k apply -f argocd/environments/microservice/dev .
argocd admin initial-password -n argocd
kubectl port-forward svc/argocd-server -n argocd 8081:443
