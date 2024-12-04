#!/bin/bash

function_uninstall(){
   echo "---------------------------------------------------------"
   echo "Deleting Resources"
   echo "---------------------------------------------------------"
   kubectl delete namespace --all
   echo "---------------------------------------------------------"
   clear
}

function_uninstall
