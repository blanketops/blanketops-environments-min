#!/bin/bash

function_uninstall(){

   echo "---------------------------------------------------------"
   echo "Deleting all Crossplane Resources---------------------------"
   echo "---------------------------------------------------------"
   kubectl patch crd/environments.batch.blanketops.co.za -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl delete environment --all
   kubectl delete composition --all
   kubectl delete compositeresourcedefinition --all
   echo "---------------------------------------------------------"

   echo "Deleting all ArgoCD Resources---------------------------"
   echo "---------------------------------------------------------"
   kubectl patch crd/applications.applications.argocd.crossplane.io -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl delete applications.applications.argocd.crossplane.io  --all

   kubectl patch crd/applications.argoproj.io -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl delete applications.argoproj.io --all

   kubectl patch crd/applicationsets.applicationsets.argocd.crossplane.io -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl delete applicationsets.applicationsets.argocd.crossplane.io --all

   kubectl patch crd/applicationsets.argoproj.io -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl delete applicationsets.argoproj.io--all

   kubectl patch crd/appprojects.argoproj.io -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl delete appprojects.argoproj.io --all

   kubectl patch crd/service.ecs.aws.upbound.io -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl delete service.ecs.aws.upbound.io --all

   kubectl patch crd/taskdefinition.ecs.aws.upbound.io -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl delete taskdefinition.ecs.aws.upbound.io --all

   echo "Deleting all AWS ECS Resources---------------------------"
   echo "---------------------------------------------------------"
   kubectl patch crd/capacityprovider.ecs.aws.upbound.io -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl delete capacityprovider.ecs.aws.upbound.io --all

   kubectl patch crd/cluster.ecs.aws.upbound.io -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl delete cluster.ecs.aws.upbound.io --all

   kubectl patch crd/clustercapacityproviders.ecs.aws.upbound.io -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl delete clustercapacityproviders.ecs.aws.upbound.io --all

   kubectl patch crd/service.ecs.aws.upbound.io -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl delete service.ecs.aws.upbound.io --all

   kubectl patch crd/taskdefinition.ecs.aws.upbound.io -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl delete taskdefinition.ecs.aws.upbound.io --all

   echo "---------------------------------------------------------"
   echo "Deleting Namespaces"
   echo "---------------------------------------------------------" 
   kubectl delete namespaces --all --force
   echo "---------------------------------------------------------"
   clear

   helm repo remove localstack-charts
   helm repo remove crossplane-stable
   echo "---------------------------------------------------------"
}

function_uninstall
