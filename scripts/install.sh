#!/bin/bash

function_install(){
  function_install_argocd
  function_install_crossplane
}

function_install_argocd(){
   echo "---------------------------------------------------------"
   echo "Initializing Resources"
   echo "---------------------------------------------------------"
   kubectl create ns argocd
   kubectl apply -f argocd/install.yaml -n argocd

   echo "Complete!"
   echo "----------------------------------------------------------------------------------"
   echo "Waiting for Next Instructions!...."
   sleep 60
   sleep 120
   echo "Patching ArgoCD Service"
   echo "----------------------------------------------------------------------------------"

   kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
   echo "Complete!"
   echo "----------------------------------------------------------------------------------"
   echo "Waiting for Next Instructions!...."
   sleep 10
   clear
}


function_install_crossplane(){
   echo "---------------------------------------------------------"
   echo "Installing Crossplane Argocd Application"
   echo "---------------------------------------------------------"
   helm repo add crossplane-stable https://charts.crossplane.io/stable
   helm install crossplane crossplane-stable/crossplane --namespace crossplane-system --create-namespace
   echo "---------------------------------------------------------"
   echo "Complete!"
   echo "----------------------------------------------------------------------------------"
   echo "Waiting for Next Instructions!...."
   sleep 10
   clear
}

function_install_localstack(){
   echo "---------------------------------------------------------"
   echo "Installing LocalStack Argocd Application"
   echo "---------------------------------------------------------"
   helm repo add localstack-charts https://localstack.github.io/helm-charts
   helm install localstack localstack-charts/localstack --namespace localstack --create-namespace
   echo "---------------------------------------------------------"
   echo "Complete!"
   echo "----------------------------------------------------------------------------------"
   echo "Waiting for Next Instructions!...."
   sleep 10
   clear
}

function_install_tekton_pipelines(){
   echo "---------------------------------------------------------"
   echo "Initializing Pipeline Resources"
   echo "---------------------------------------------------------"
   kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml
   echo "---------------------------------------------------------"
   echo "Complete!"
   echo "----------------------------------------------------------------------------------"
   echo "Waiting for Next Instructions!...."
   sleep 10
   clear
}

function_install_tekton_dashboards(){
   echo "---------------------------------------------------------"
   echo "Initializing Tekton Dasboard Resources"
   echo "---------------------------------------------------------"
   kubectl apply --filename https://storage.googleapis.com/tekton-releases/dashboard/latest/release.yaml
   echo "---------------------------------------------------------"
   echo "Complete!"
   echo "----------------------------------------------------------------------------------"
   echo "Waiting for Next Instructions!...."
   sleep 10
   clear
}

function_install_tekton_triggers(){
   echo "---------------------------------------------------------"
   echo "Initializing Triggers Resources"
   echo "---------------------------------------------------------"
   kubectl apply --filename https://storage.googleapis.com/tekton-releases/triggers/latest/release.yaml
   kubectl apply --filename https://storage.googleapis.com/tekton-releases/triggers/latest/interceptors.yaml
   echo "---------------------------------------------------------"
   echo "Complete!"
   echo "----------------------------------------------------------------------------------"
   echo "Waiting for Next Instructions!...."
   sleep 10
   clear
}

function_install_the_knative_operator(){
   echo "-------------------------------------"
   echo "Initializing KNative Operator Resources"
   echo "---------------------------------------------------------"
   kubectl apply -f https://github.com/knative/operator/releases/download/knative-v1.16.0/operator.yaml
   echo "---------------------------------------------------------"
   echo "Complete!"
   echo "----------------------------------------------------------------------------------"
   echo "Waiting for Next Instructions!...."
   sleep 10
   clear
}

function_install_knative_serving_without_istio(){
   echo "---------------------------------------------------------"
   echo "Verify signed images"
   echo "----------------------------------------"
   curl -sSL https://github.com/knative/serving/releases/download/knative-v1.16.0/serving-crds.yaml \
  | grep 'gcr.io/' | awk '{print $2}' | sort | uniq \
  | xargs -n 1 \
    cosign verify -o text \
      --certificate-identity=signer@knative-releases.iam.gserviceaccount.com \
      --certificate-oidc-issuer=https://accounts.google.com

     curl -sSL https://github.com/knative/serving/releases/download/knative-v1.16.0/serving-core.yaml \
  | grep 'gcr.io/' | awk '{print $2}' | sort | uniq \
  | xargs -n 1 \
    cosign verify -o text \
      --certificate-identity=signer@knative-releases.iam.gserviceaccount.com \
      --certificate-oidc-issuer=https://accounts.google.com   
   echo "-------------------------------------"
   echo "Initializing KNative Serving Resources"
   echo "---------------------------------------------------------"
   kubectl create namespace knative-serving
   kubectl apply -f https://github.com/knative/serving/releases/knative-v1.16.0/download/serving-crds.yaml
   kubectl apply -f https://github.com/knative/serving/releases/knative-v1.16.0/download/serving-core.yaml
   
   echo "---------------------------------------------------------"
   echo "Complete!"
   echo "----------------------------------------------------------------------------------"
   echo "Waiting for Next Instructions!...."
   sleep 10
   clear
}

function_install_knative_eventing(){
   echo "---------------------------------------------------------"
   echo "Verify signed images"
   echo "----------------------------------------"
   curl -sSL https://github.com/knative/serving/releases/download/knative-v1.16.0/serving-core.yaml \
  | grep 'gcr.io/' | awk '{print $2}' | sort | uniq \
  | xargs -n 1 \
    cosign verify -o text \
      --certificate-identity=signer@knative-releases.iam.gserviceaccount.com \
      --certificate-oidc-issuer=https://accounts.google.com
   
   echo "-------------------------------------"
   echo "Initializing KNative Eventing Resources"
   echo "---------------------------------------------------------"
   kubectl create namespace knative-eventing
   kubectl apply -f https://github.com/knative/eventing/releases/download/knative-v1.16.3/eventing-crds.yaml
   
   echo "---------------------------------------------------------"
   echo "Complete!"
   echo "----------------------------------------------------------------------------------"
   echo "Waiting for Next Instructions!...."
   sleep 10
   clear
}

function_install_knative_github_sources(){
   echo "-------------------------------------"
   echo "Initializing KNatibe Github Resources"
   echo "---------------------------------------------------------"
   kubectl apply -f github/github.yaml
   echo "---------------------------------------------------------"
   echo "Complete!"
   echo "----------------------------------------------------------------------------------"
   echo "Waiting for Next Instructions!...."
   sleep 10
   clear
}

function_install_kourier(){
   echo "-------------------------------------"
   echo "Initializing Kourier Resources"
   echo "---------------------------------------------------------"
   kubectl apply -f kourier/kourier.yaml
   kubectl apply -f kourier/loadbalancer.yaml -n kourier-system
   echo "---------------------------------------------------------"
   echo "Complete!"
   echo "----------------------------------------------------------------------------------"
   echo "Waiting for Next Instructions!...."
   sleep 10
   clear
}

function_install_metallb(){
  echo "-------------------------------------"
  echo "Initializing Metallb Resources"
  echo "---------------------------------------------------------"
  kubectl apply -f metallb/metallb.yaml
  echo "---------------------------------------------------------"
  echo "Complete!"
  echo "----------------------------------------------------------------------------------"
  echo "Waiting for Next Instructions...."
  sleep 10
  clear
}

function_install
