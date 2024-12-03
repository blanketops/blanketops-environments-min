#!/bin/bash
# BlanketOps CrossPlane Manifests
# Neo Tlaletsi
#

#install_crossplane()
#install_argocd()
#install_localstack()


function_install_crossplane(){
   #setup and install crossplane here
   echo "Installing Crossplane Helm Chart"
   echo "---------------------------------------------------------"
   helm repo add crossplane-stable https://charts.crossplane.io/stable
   helm repo update
   helm install crossplane crossplane-stable/crossplane --namespace crossplane-system --create-namespace
   echo "---------------------------------------------------------"
   sleep 30
   clear
}

function_install_localstack(){
   echo "Installing LocalStack Helm Chart"
   echo "---------------------------------------------------------"
   helm repo add localstack-repo https://helm.localstack.cloud
   helm upgrade --install localstack localstack-repo/localstack --namespace localstack --create-namespace
   echo "---------------------------------------------------------"
   sleep 30
   clear
}
function_setup_localstack(){
   echo "Setting up LocalStack"
   echo "---------------------------------------------------------"
   export NODE_PORT=$(kubectl get --namespace "localstack" -o jsonpath="{.spec.ports[0].nodePort}" services localstack)
   export NODE_IP=$(kubectl get nodes --namespace "localstack" -o jsonpath="{.items[0].status.addresses[0].address}")
   echo http://$NODE_IP:$NODE_PORT
   echo "---------------------------------------------------------"
   sleep 30
   clear
}

function_install_secrets_store(){
   echo "Installing Secrets Store Helm Chart"
   echo "---------------------------------------------------------"
   helm repo add external-secrets https://charts.external-secrets.io
   helm install external-secrets external-secrets/external-secrets -n external-secrets --create-namespace --set installCRDs=false

   sleep 30

   kubectl apply -f services/secrets_store/
   echo "---------------------------------------------------------"
   clear
}

function_healthcheck_secrets_store(){

   echo "HealthCheck Secrets Store Installation"
   echo "---------------------------------------------------------"
   kubectl get SecretStores,ClusterSecretStores,ExternalSecrets --all-namespaces
   echo "---------------------------------------------------------"
   clear
}

function_uninstall_secrets_store(){

   echo "Uninstalling Secrets Store Helm Chart"
   echo "---------------------------------------------------------"
   helm delete external-secrets --namespace external-secrets
   echo "---------------------------------------------------------"
   clear
}

function_install_aws_provider_providerconfig_with_bucket(){

   echo "Installing AWS Crossplane Secret"
   echo "---------------------------------------------------------" 
   kubectl create secret generic aws-secret -n crossplane-system --from-file=creds=secrets/./aws-credentials.txt
   echo "---------------------------------------------------------"
   sleep 30

   echo "Connect AWS Crossplane Base Providers"
   echo "---------------------------------------------------------" 
   kubectl apply -f providers/aws/aws_s3.yaml
   kubectl apply -f providers/aws/aws_dynamodb.yaml
   kubectl apply -f providers/aws/aws_ecr.yaml
   kubectl apply -f providers/aws/aws_ecs.yaml
   echo "---------------------------------------------------------"
   sleep 30

   echo "Connect AWS Crossplane ProviderConfig"
   echo "---------------------------------------------------------" 
   kubectl apply -f providerconfigs/aws.yaml
   echo "---------------------------------------------------------"
   sleep 30

   # echo "Create the Example Bucket"
   # echo "---------------------------------------------------------" 
   # kubectl apply -f services/aws/s3/s3_bucket.yaml
   # echo "---------------------------------------------------------"
   # sleep 30
   # clear

   # echo "Check if Bucket is available"
   # echo "---------------------------------------------------------" 
   # kubectl describe buckets
   # echo "---------------------------------------------------------"
   # sleep 30
   clear
}

function_health_check_crossplane(){
   #healthcheck crossplane here
   echo "HealthCheck Crossplane Installation"
   echo "---------------------------------------------------------"
   kubectl get pod --namespace crossplane-system
   sleep 30
   kubectl api-resources  | grep crossplane
   echo "---------------------------------------------------------"
   clear
}

function_uninstall_crossplane(){
   #uninstall crossplane here
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

function_install_argocd(){
   echo "Initializing Resources"
   echo "---------------------------------------------------------"

   kubectl create ns argocd
   kubectl apply -f secrets/argocd_blanketops_private_repo.yaml
   kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

   echo "Complete!"
   echo "----------------------------------------------------------------------------------"
   echo "Waiting for Next Instructions...."
   sleep 60
   sleep 120
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
   sleep 30
   echo "---------------------------------------------------------"

   echo "Creating Crossplane Terraform Secrets"
   echo "---------------------------------------------------------"
   kubectl create namespace upbound-system
   # kubectl create secret generic aws-creds -n upbound-system --from-file=creds=secrets/./aws-creds.ini
   # kubectl create secret generic terraformrc -n upbound-system --from-file=creds=secrets/./.terraformrc
   sleep 30
   echo "---------------------------------------------------------"

   echo "Creating Crossplane Terraform ProviderConfig"
   echo "---------------------------------------------------------"
   kubectl apply -f providerconfigs/terraform.yaml
   sleep 30
   echo "---------------------------------------------------------"

   # echo "Adding WorkSpace"
   # echo "---------------------------------------------------------"
   # kubectl apply -f services/terraform/terraform_aws_workspace.yaml
   # sleep 30
   # echo "---------------------------------------------------------"
   clear
}

function_health_check_terraform_components(){
   echo "Describe Crossplane Terraform AWS Workspace"
   echo "---------------------------------------------------------"
   kubectl describe workspaces
   sleep 30
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
   sleep 60
   clear
}

function_install_tekton_dashboards(){
   echo "Initializing Tekton Dasboard Resources"
   echo "---------------------------------------------------------"
   kubectl apply --filename https://storage.googleapis.com/tekton-releases/dashboard/latest/release.yaml
   echo "---------------------------------------------------------"
   sleep 60
   clear
}

function_install_tekton_triggers(){
   echo "Initializing Triggers Resources"
   echo "---------------------------------------------------------"
   kubectl apply --filename https://storage.googleapis.com/tekton-releases/triggers/latest/release.yaml
   kubectl apply --filename https://storage.googleapis.com/tekton-releases/triggers/latest/interceptors.yaml
   echo "---------------------------------------------------------"
   sleep 60
   clear
}

function_cleanup(){
   function_uninstall_crossplane 
   function_uninstall_argocd
   function_uninstall_secrets_store
   function_uninstall_terraform_components
}

function_cleanup
# function_health_check_crossplane
function_install_crossplane
# function_install_secrets_store
# sleep 120
function_install_aws_provider_providerconfig_with_bucket
# sleep 120
# function_install_jaeger


# function_uninstall_terraform_components
function_install_terraform_components
sleep 120
function_health_check_terraform_components
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
   sleep 60
   kubectl get pods -n cert-manager
   sleep 5
   helm repo add jaegertracing https://jaegertracing.github.io/helm-charts
   kubectl create ns observability
   helm install my-release jaegertracing/jaeger-operator -n observability
   echo "---------------------------------------------------------"
   sleep 60
   kubectl create ns observability
   sleep 30
   kubectl create -f https://github.com/jaegertracing/jaeger-operator/releases/download/v1.36.0/jaeger-operator.yaml -n observability
   sleep 60
   kubectl get deployment jaeger-operator -n observability
   clear
}