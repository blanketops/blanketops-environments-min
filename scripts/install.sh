#!/bin/bash

function_install(){
  function_install_argocd
  function_install_crossplane
  function_install_knative_serving_without_istio
  function_install_kourier
  function_install_knative_eventing
  function_install_knative_github_sources
  function_install_tekton_dashboards
  function_install_tekton_pipelines
  function_install_tekton_triggers
  function_install_metallb
}

function_install_argocd(){
  echo "---------------------------------------------------------"
  echo "Installing ArgoCD..."
  echo "---------------------------------------------------------"
  kubectl create ns argocd
  kubectl apply -f dependencies/argocd/install.yaml -n argocd
  echo "Complete!"
  echo "----------------------------------------------------------------------------------"
  echo "Waiting for Next Instructions!...."

  secs=$((5 * 1))
  while [ $secs -gt 0 ]; do
    echo -ne "$secs\033[0K\r"
    sleep 1
    : $((secs--))
  done 

  echo "Patching ArgoCD Service..."
  echo "----------------------------------------------------------------------------------"
  kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
  echo "Complete!"
  echo "----------------------------------------------------------------------------------"
  echo "Waiting for Next Instructions!...."

  secs=$((5 * 1))
  while [ $secs -gt 0 ]; do
    echo -ne "$secs\033[0K\r"
    sleep 1
    : $((secs--))
  done
  
}


function_install_crossplane(){
  echo "---------------------------------------------------------"
  echo "Installing Crossplane Argocd Helm Chart..."
  echo "---------------------------------------------------------"
  helm repo add crossplane-stable https://charts.crossplane.io/stable
  helm install crossplane crossplane-stable/crossplane --namespace crossplane-system --create-namespace
  echo "---------------------------------------------------------"
  echo "Complete!"
  echo "----------------------------------------------------------------------------------"
  echo "Waiting for Next Instructions!...."

  secs=$((5 * 1))
  while [ $secs -gt 0 ]; do
    echo -ne "$secs\033[0K\r"
    sleep 1
    : $((secs--))
  done
  
}

function_install_localstack(){
  echo "---------------------------------------------------------"
  echo "Installing LocalStack Argocd Application..."
  echo "---------------------------------------------------------"
  helm repo add localstack-charts https://localstack.github.io/helm-charts
  helm install localstack localstack-charts/localstack --namespace localstack --create-namespace
  echo "---------------------------------------------------------"
  echo "Complete!"
  echo "----------------------------------------------------------------------------------"
  echo "Waiting for Next Instructions!...."

  secs=$((5 * 1))
  while [ $secs -gt 0 ]; do
    echo -ne "$secs\033[0K\r"
    sleep 1
    : $((secs--))
  done
  
}

function_install_tekton_pipelines(){
  echo "---------------------------------------------------------"
  echo "Installing Tekton Pipelines..."
  echo "---------------------------------------------------------"
  kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml
  echo "---------------------------------------------------------"
  echo "Complete!"
  echo "----------------------------------------------------------------------------------"
  echo "Waiting for Next Instructions!...."

  secs=$((5 * 1))
  while [ $secs -gt 0 ]; do
    echo -ne "$secs\033[0K\r"
    sleep 1
    : $((secs--))
  done
  
}

function_install_tekton_dashboards(){
  echo "---------------------------------------------------------"
  echo "Installing Tekton Dasboard..."
  echo "---------------------------------------------------------"
  kubectl apply --filename https://storage.googleapis.com/tekton-releases/dashboard/latest/release.yaml
  echo "---------------------------------------------------------"
  echo "Complete!"
  echo "----------------------------------------------------------------------------------"
  echo "Waiting for Next Instructions!...."

  secs=$((5 * 1))
  while [ $secs -gt 0 ]; do
    echo -ne "$secs\033[0K\r"
    sleep 1
    : $((secs--))
  done
  
}

function_install_tekton_triggers(){
  echo "---------------------------------------------------------"
  echo "Installing Tekton Triggers..."
  echo "---------------------------------------------------------"
  kubectl apply --filename https://storage.googleapis.com/tekton-releases/triggers/latest/release.yaml
  kubectl apply --filename https://storage.googleapis.com/tekton-releases/triggers/latest/interceptors.yaml
  echo "---------------------------------------------------------"
  echo "Complete!"
  echo "----------------------------------------------------------------------------------"
  echo "Waiting for Next Instructions!...."

  secs=$((5 * 1))
  while [ $secs -gt 0 ]; do
    echo -ne "$secs\033[0K\r"
    sleep 1
    : $((secs--))
  done
  
}

function_install_knative_serving_without_istio(){
  echo "---------------------------------------------------------"
  echo "Installing KNative Serving Without Istio..."
  echo "---------------------------------------------------------"

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
  echo "Installing KNative Serving..."
  echo "---------------------------------------------------------"
  kubectl create namespace knative-serving
  kubectl apply -f dependencies/knative/serving-core.yaml
  kubectl apply -f dependencies/knative/serving-crds.yaml
  echo "---------------------------------------------------------"
  echo "Complete!"
  echo "----------------------------------------------------------------------------------"
  echo "Waiting for Next Instructions!...."

  secs=$((5 * 1))
  while [ $secs -gt 0 ]; do
    echo -ne "$secs\033[0K\r"
    sleep 1
    : $((secs--))
  done
  
}

function_install_knative_eventing(){
  echo "---------------------------------------------------------"
  echo "Installing KNative Eventing..."
  echo "---------------------------------------------------------"
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
  kubectl apply -f dependencies/knative/eventing-crds.yaml
   
  echo "---------------------------------------------------------"
  echo "Complete!"
  echo "----------------------------------------------------------------------------------"
  echo "Waiting for Next Instructions!...."

  secs=$((5 * 1))
  while [ $secs -gt 0 ]; do
    echo -ne "$secs\033[0K\r"
    sleep 1
    : $((secs--))
  done
  
}

function_install_knative_github_sources(){
  echo "-------------------------------------"
  echo "Initializing KNatibe Github..."
  echo "---------------------------------------------------------"
  kubectl apply -f manager/resources/github/github.yaml
  echo "---------------------------------------------------------"
  echo "Complete!"
  echo "----------------------------------------------------------------------------------"
  echo "Waiting for Next Instructions!...."

  secs=$((5 * 1))
  while [ $secs -gt 0 ]; do
    echo -ne "$secs\033[0K\r"
    sleep 1
    : $((secs--))
  done
  
}

function_install_kourier(){
  echo "-------------------------------------"
  echo "Initializing KNative Kourier..."
  echo "---------------------------------------------------------"
  kubectl apply -f dependencies/kourier/kourier.yaml
  kubectl apply -f dependencies/kourier/loadbalancer.yaml -n kourier-system
  echo "---------------------------------------------------------"
  echo "Complete!"
  echo "----------------------------------------------------------------------------------"
  echo "Waiting for Next Instructions!...."

  secs=$((5 * 1))
  while [ $secs -gt 0 ]; do
    echo -ne "$secs\033[0K\r"
    sleep 1
    : $((secs--))
  done
  
}

function_install_metallb(){
  echo "-------------------------------------"
  echo "Initializing Metallb..."
  echo "---------------------------------------------------------"
  kubectl apply -f dependencies/bare_metal_loadbalancer/metallb.yaml
  echo "---------------------------------------------------------"
  echo "Complete!"
  echo "----------------------------------------------------------------------------------"
  echo "Waiting for Next Instructions...."

  secs=$((5 * 1))
  while [ $secs -gt 0 ]; do
    echo -ne "$secs\033[0K\r"
    sleep 1
    : $((secs--))
  done
  
}

function_install
