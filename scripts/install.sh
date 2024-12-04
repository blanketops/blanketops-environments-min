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
   clear
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

function_install_the_knative_operator(){

   echo "-------------------------------------"
   echo "Verify signed images"
   echo "----------------------------------------"
   curl -sSL https://github.com/knative/serving/releases/download/knative-v1.16.0/serving-core.yaml \
  | grep 'gcr.io/' | awk '{print $2}' | sort | uniq \
  | xargs -n 1 \
    cosign verify -o text \
      --certificate-identity=signer@knative-releases.iam.gserviceaccount.com \
      --certificate-oidc-issuer=https://accounts.google.com

   sleep 5
   echo "Initializing KNative Operator Resources"
   echo "---------------------------------------------------------"
   kubectl apply -f https://github.com/knative/operator/releases/download/knative-v1.16.0/operator.yaml
   echo "---------------------------------------------------------"
   clear
}

function_install_knative_serving(){
   echo "-------------------------------------"
   echo "Initializing KNative Serving Resources"
   echo "---------------------------------------------------------"
   kubectl apply -f knative/knative_serving.yaml
   sleep 15
   echo "---------------------------------------------------------"
   clear
}

function_install_knative_eventing(){
   echo "-------------------------------------"
   echo "Initializing KNative Eventing Resources"
   echo "---------------------------------------------------------"
   kubectl apply -f knative/knative_eventing.yaml
   sleep 15
   echo "---------------------------------------------------------"
   clear
}

function_install_knative_github_sources(){
   echo "-------------------------------------"
   echo "Initializing KNatibe Github Resources"
   echo "---------------------------------------------------------"
   kubectl apply -f github/github.yaml
   sleep 15
   echo "---------------------------------------------------------"
   clear
}
function_install_kourier(){
   echo "-------------------------------------"
   echo "Initializing Kourier Resources"
   echo "---------------------------------------------------------"
   kubectl create namespace knative-serving
   kubectl apply -f kourier/kourier.yaml
   sleep 15
   echo "---------------------------------------------------------"
   clear
}

# function_install_argocd
# function_install_crossplane
# function_install_terraform_components
# function_install_tekton_dashboards
# function_install_tekton_pipelines
# function_install_tekton_triggers
function_install_the_knative_operator
function_install_kourier
function_install_knative_serving
function_install_knative_eventing
function_install_knative_github_sources