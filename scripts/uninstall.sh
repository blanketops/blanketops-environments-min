#!/bin/bash

function_uninstall(){
   echo "---------------------------------------------------------"
   echo "Deleting Resources"
   echo "---------------------------------------------------------"
   kubectl delete namespaces --all --force
   echo "---------------------------------------------------------"
   clear
}

function_uninstall
