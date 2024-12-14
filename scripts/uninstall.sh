#!/bin/bash

function_uninstall(){

  
   echo "Deleting all Crossplane Resources---------------------------"
   echo "---------------------------------------------------------"
   kubectl delete environment --all
   kubectl delete composition --all
   kubectl delete compositeresourcedefinition --all
   echo "---------------------------------------------------------"

   echo "---------------------------------------------------------"
   echo "Deleting Resources"
   echo "---------------------------------------------------------"
   kubectl delete 
   kubectl delete namespaces --all --force
   echo "---------------------------------------------------------"
   clear

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

}

function_uninstall
