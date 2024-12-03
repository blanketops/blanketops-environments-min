#!/bin/bash


function_install_argocd(){
   echo "Initializing Resources"
   echo "---------------------------------------------------------"

   kubectl create ns argocd
   kubectl apply -f secrets/argocd_blanketops_private_repo.yaml
   kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

   echo "Complete!"
   echo "----------------------------------------------------------------------------------"
   echo "Waiting for Next Instructions...."
   sleep 15
   # sleep 15
   clear

   echo "Patching ArgoCD Service"
   echo "----------------------------------------------------------------------------------"

   kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

   echo "Complete!"
   echo "----------------------------------------------------------------------------------"
   echo "Waiting for Next Instructions...."
   sleep 10
   clear
}

function_install_crossplane(){
   echo "---------------------------------------------------------"
   echo "Installing Crossplane Argocd Application"
   echo "---------------------------------------------------------"
   kubectl create namespace crossplane-system
   kubectl apply -f argocd/crossplane_application.yaml
   echo "---------------------------------------------------------"
   sleep 15
   function_health_check_crossplane
   clear
}

function_health_check_crossplane(){
   echo "---------------------------------------------------------"
   echo "HealthCheck Crossplane Installation"
   echo "---------------------------------------------------------"
   kubectl get pod --namespace crossplane-system
   sleep 15
   clear
   kubectl api-resources  | grep crossplane
   echo "---------------------------------------------------------"
   clear
}

function_setup_crossplane(){
   function_install_aws_provider_providerconfig_with_bucket
}

function_install_localstack(){
   echo "---------------------------------------------------------"
   echo "Installing LocalStack Argocd Application"
   echo "---------------------------------------------------------"
   kubectl create namespace localstack
   kubectl apply -f argocd/localstack_application.yaml
   echo "---------------------------------------------------------"
   sleep 15
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
   sleep 15
   clear
}


function_install_aws_provider_providerconfig_with_bucket(){

   echo "Installing AWS Crossplane Secret"
   echo "---------------------------------------------------------" 
   kubectl create secret generic aws-secret -n crossplane-system --from-file=creds=secrets/./aws-credentials.txt
   echo "---------------------------------------------------------"
   sleep 15

   echo "Connect AWS Crossplane Base Providers"
   echo "---------------------------------------------------------" 
   kubectl apply -f providers/aws/aws_s3.yaml
   kubectl apply -f providers/aws/aws_dynamodb.yaml
   kubectl apply -f providers/aws/aws_ecr.yaml
   kubectl apply -f providers/aws/aws_ecs.yaml
   echo "---------------------------------------------------------"
   sleep 15

   echo "Connect AWS Crossplane ProviderConfig"
   echo "---------------------------------------------------------" 
   kubectl apply -f providerconfigs/aws.yaml
   echo "---------------------------------------------------------"
   sleep 15

   echo "Create the Example Bucket"
   echo "---------------------------------------------------------" 
   kubectl apply -f services/aws/s3/s3_bucket.yaml
   echo "---------------------------------------------------------"
   sleep 15
   clear

   echo "Check if Bucket is available"
   echo "---------------------------------------------------------" 
   kubectl describe buckets
   echo "---------------------------------------------------------"
   sleep 15

   echo "Destroy the bucket"
   echo "---------------------------------------------------------" 
   kubectl delete buckets --all
   echo "---------------------------------------------------------"
   sleep 15
   clear
}



function_uninstall_crossplane(){
   echo "Uninstalling Crossplane Helm Chart"
   echo "---------------------------------------------------------"
   kubectl delete bucket --all
   kubectl delete providers --all
   helm repo remove crossplane-stable
   echo "---------------------------------------------------------"
   echo "Disconnect Crossplane AWS ProviderConfig"
   echo "---------------------------------------------------------"
   kubectl delete providerconfig.aws.upbound.io --all
   echo "---------------------------------------------------------"
   echo "Delete All Crossplane AWS S3 Buckets"
   echo "---------------------------------------------------------"
   kubectl delete buckets --all
   kubectl delete namespace crossplane-system
   echo "---------------------------------------------------------"
   clear
}


function_uninstall_argocd(){
   echo "Deleting Resources"
   echo "---------------------------------------------------------"

   kubectl delete ns argocd
   kubectl delete application.argoproj.io --all --all-namespaces
   echo "---------------------------------------------------------"
   clear
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
   # kubectl create secret generic aws-creds -n upbound-system --from-file=creds=secrets/./aws-creds.ini
   # kubectl create secret generic terraformrc -n upbound-system --from-file=creds=secrets/./.terraformrc
   sleep 15
   echo "---------------------------------------------------------"

   echo "Creating Crossplane Terraform ProviderConfig"
   echo "---------------------------------------------------------"
   kubectl apply -f providerconfigs/terraform.yaml
   sleep 15
   echo "---------------------------------------------------------"

   # echo "Adding WorkSpace"
   # echo "---------------------------------------------------------"
   # kubectl apply -f services/terraform/terraform_aws_workspace.yaml
   # sleep 15
   # echo "---------------------------------------------------------"
   clear
}

function_health_check_terraform_components(){
   echo "Describe Crossplane Terraform AWS Workspace"
   echo "---------------------------------------------------------"
   kubectl describe workspaces
   sleep 15
   echo "---------------------------------------------------------"

}

function_uninstall_terraform_components(){
   echo "Uninstalling Crossplane Terraform Provider"
   echo "---------------------------------------------------------"
   kubectl delete providers provider-terraform
   echo "---------------------------------------------------------"

   echo "Deleting Crossplane Terraform Secrets"
   echo "---------------------------------------------------------"
   kubectl delete namespace upbound-system
   echo "---------------------------------------------------------"

   echo "Disconnect Crossplane Terraform ProviderConfig"
   echo "---------------------------------------------------------"
   kubectl delete providerconfig.tf.upbound.io --all
   echo "---------------------------------------------------------"
   echo "Delete Crossplane Terraform WorkSpaces"
   echo "---------------------------------------------------------"
   kubectl delete workspaces --all
   echo "---------------------------------------------------------"
   clear
}

function_install_tekton_pipelines(){
   echo "Initializing Pipeline Resources"
   echo "---------------------------------------------------------"
   kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml
   echo "---------------------------------------------------------"
   sleep 15
   clear
}

function_install_tekton_dashboards(){
   echo "Initializing Tekton Dasboard Resources"
   echo "---------------------------------------------------------"
   kubectl apply --filename https://storage.googleapis.com/tekton-releases/dashboard/latest/release.yaml
   echo "---------------------------------------------------------"
   sleep 15
   clear
}

function_install_tekton_triggers(){
   echo "Initializing Triggers Resources"
   echo "---------------------------------------------------------"
   kubectl apply --filename https://storage.googleapis.com/tekton-releases/triggers/latest/release.yaml
   kubectl apply --filename https://storage.googleapis.com/tekton-releases/triggers/latest/interceptors.yaml
   echo "---------------------------------------------------------"
   sleep 15
   clear
}

function_cleanup(){
   function_uninstall_crossplane 
   function_uninstall_argocd
   function_uninstall_secrets_store
   function_uninstall_terraform_components
}

function_cleanup
function_install_argocd
function_install_crossplane
function_setup_crossplane







# function_install_secrets_store
# sleep 15
# function_install_jaeger


# function_uninstall_terraform_components
#function_install_terraform_components
#sleep 15
#function_health_check_terraform_components
# function_uninstall_argocd
# function_install_argocd
# function_install_tekton_pipelines
# function_install_tekton_dashboards
# function_install_tekton_triggers
# function_install_jaeger

function_install_jaeger(){
   echo "Initializing Jaegar Resources"
   echo "---------------------------------------------------------"
   kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.9.0/cert-manager.yaml
   sleep 15
   kubectl get pods -n cert-manager
   sleep 5
   helm repo add jaegertracing https://jaegertracing.github.io/helm-charts
   kubectl create ns observability
   helm install my-release jaegertracing/jaeger-operator -n observability
   echo "---------------------------------------------------------"
   sleep 15
   kubectl create ns observability
   sleep 15
   kubectl create -f https://github.com/jaegertracing/jaeger-operator/releases/download/v1.36.0/jaeger-operator.yaml -n observability
   sleep 15
   kubectl get deployment jaeger-operator -n observability
   clear
}