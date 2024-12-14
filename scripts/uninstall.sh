#!/bin/bash

function_uninstall(){

   echo "Deleting all AWS ECS Resources---------------------------"
   echo "---------------------------------------------------------"
   kubectl delete capacityprovider.ecs.aws.upbound.io --all 
   kubectl delete cluster.ecs.aws.upbound.io --all 
   kubectl delete clustercapacityproviders.ecs.aws.upbound.io --all 
   kubectl delete service.ecs.aws.upbound.io --all 
   kubectl delete taskdefinition.ecs.aws.upbound.io --all 
   echo "---------------------------------------------------------"

   echo "---------------------------------------------------------"
   echo "Deleting Resources"
   echo "---------------------------------------------------------"
   kubectl delete 
   kubectl delete namespaces --all --force
   echo "---------------------------------------------------------"
   clear
}

function_uninstall
