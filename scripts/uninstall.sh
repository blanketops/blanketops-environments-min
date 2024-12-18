#!/bin/bash

function_uninstall(){

   echo "---------------------------------------------------------"
   echo "Deleting all Crossplane Resources---------------------------"
   echo "---------------------------------------------------------"
   kubectl patch crd/environments.batch.blanketops.co.za -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl delete environment --all
   kubectl delete composition --all
   kubectl delete compositeresourcedefinition --all
   echo "--------------------------------------------------------------------------------------------------------------------------------"

   echo "Silence Patch all CRD Finalizers--------------------------------------------------------------------------------------------------------"
   echo "----------------------------------------------------------------------------------------------------------------------------------"
   kubectl patch crd/accountsettingdefaults.ecs.aws.upbound.io                   -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/addresspools.metallb.io                                     -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/apiserversources.sources.knative.dev                        -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/applications.applications.argocd.crossplane.io              -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/applications.argoproj.io                                    -p '{"metadata":{"finalizers":[]}}' --type=merge

   kubectl patch crd/applicationsets.applicationsets.argocd.crossplane.io        -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/applicationsets.argoproj.io                                 -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/appprojects.argoproj.io                                     -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/bfdprofiles.metallb.io                                      -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/bgpadvertisements.metallb.io                                -p '{"metadata":{"finalizers":[]}}' --type=merge

   kubectl patch crd/bgppeers.metallb.io                                         -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/brokers.eventing.knative.dev                                -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/bucketaccelerateconfigurations.s3.aws.upbound.io            -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/bucketacls.s3.aws.upbound.io                                -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/bucketanalyticsconfigurations.s3.aws.upbound.io             -p '{"metadata":{"finalizers":[]}}' --type=merge

   kubectl patch crd/bucketcorsconfigurations.s3.aws.upbound.io                  -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/bucketintelligenttieringconfigurations.s3.aws.upbound.io    -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/bucketinventories.s3.aws.upbound.io                         -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/bucketlifecycleconfigurations.s3.aws.upbound.io             -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/bucketloggings.s3.aws.upbound.io                            -p '{"metadata":{"finalizers":[]}}' --type=merge

   kubectl patch crd/bucketmetrics.s3.aws.upbound.io                             -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/bucketnotifications.s3.aws.upbound.io                       -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/bucketobjectlockconfigurations.s3.aws.upbound.io            -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/bucketobjects.s3.aws.upbound.io                             -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/bucketownershipcontrols.s3.aws.upbound.io                   -p '{"metadata":{"finalizers":[]}}' --type=merge

   kubectl patch crd/bucketpolicies.s3.aws.upbound.io                            -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/bucketpublicaccessblocks.s3.aws.upbound.io                  -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/bucketreplicationconfigurations.s3.aws.upbound.io           -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/bucketrequestpaymentconfigurations.s3.aws.upbound.io        -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/buckets.s3.aws.upbound.io                                   -p '{"metadata":{"finalizers":[]}}' --type=merge

   kubectl patch crd/bucketserversideencryptionconfigurations.s3.aws.upbound.io  -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/bucketversionings.s3.aws.upbound.io                         -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/bucketwebsiteconfigurations.s3.aws.upbound.io               -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/capacityproviders.ecs.aws.upbound.io                        -p '{"metadata":{"finalizers":[]}}' --type=merge 
   kubectl patch crd/certificates.networking.internal.knative.dev                -p '{"metadata":{"finalizers":[]}}' --type=merge

   kubectl patch crd/channels.messaging.knative.dev                              -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/clustercapacityproviders.ecs.aws.upbound.io                 -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/clusterdomainclaims.networking.internal.knative.dev         -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/clusterinterceptors.triggers.tekton.dev                     -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/clusters.cluster.argocd.crossplane.io                       -p '{"metadata":{"finalizers":[]}}' --type=merge

   kubectl patch crd/clusters.ecs.aws.upbound.io                                 -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/clustertasks.tekton.dev                                     -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/clustertriggerbindings.triggers.tekton.dev                  -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/clusterinterceptors.triggers.tekton.dev                     -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/communities.metallb.io                                      -p '{"metadata":{"finalizers":[]}}' --type=merge

   kubectl patch crd/compositeresourcedefinitions.apiextensions.crossplane.io    -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/compositionrevisions.apiextensions.crossplane.io            -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/compositions.apiextensions.crossplane.io                    -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/configurationrevisions.pkg.crossplane.io                    -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/configurations.pkg.crossplane.io                            -p '{"metadata":{"finalizers":[]}}' --type=merge
   
   kubectl patch crd/configurations.serving.knative.dev                          -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/containersources.sources.knative.dev                        -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/contributorinsights.dynamodb.aws.upbound.io                 -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/controllerconfigs.pkg.crossplane.io                         -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/customruns.tekton.dev                                       -p '{"metadata":{"finalizers":[]}}' --type=merge

   kubectl patch crd/deploymentruntimeconfigs.pkg.crossplane.io                  -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/directorybuckets.s3.aws.upbound.io                          -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/domainmappings.serving.knative.dev                          -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/environmentclaim.batch.blanketops.co.za                     -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/environmentconfigs.apiextensions.crossplane.io              -p '{"metadata":{"finalizers":[]}}' --type=merge




   kubectl patch crd/environments.batch.blanketops.co.za                  -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/eventlisteners.triggers.tekton.dev                           -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/eventpolicies.eventing.knative.dev                           -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/eventtypes.eventing.knative.dev                    -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/extensions.dashboard.tekton.dev               -p '{"metadata":{"finalizers":[]}}' --type=merge


   kubectl patch crd/functionrevisions.pkg.crossplane.io                     -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/functions.pkg.crossplane.io                          -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/githubbindings.bindings.knative.dev                           -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/githubsources.sources.knative.dev                       -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/globaltables.dynamodb.aws.upbound.io               -p '{"metadata":{"finalizers":[]}}' --type=merge


   kubectl patch crd/deploymentruntimeconfigs.pkg.crossplane.io                  -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/directorybuckets.s3.aws.upbound.io                          -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/domainmappings.serving.knative.dev                          -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/environmentclaim.batch.blanketops.co.za                     -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/environmentconfigs.apiextensions.crossplane.io              -p '{"metadata":{"finalizers":[]}}' --type=merge


imageconfigs.pkg.crossplane.io                               2024-12-18T07:21:43Z
images.caching.internal.knative.dev                          2024-12-18T07:21:56Z
ingresses.networking.internal.knative.dev                    2024-12-18T07:21:56Z
interceptors.triggers.tekton.dev                             2024-12-18T07:23:23Z
ipaddresspools.metallb.io                                    2024-12-18T07:23:35Z

jobsinks.sinks.knative.dev                                   2024-12-18T07:22:38Z
kinesisstreamingdestinations.dynamodb.aws.upbound.io         2024-12-18T07:30:03Z
l2advertisements.metallb.io                                  2024-12-18T07:23:35Z
lifecyclepolicies.ecr.aws.upbound.io                         2024-12-18T07:30:17Z
locks.pkg.crossplane.io                                      2024-12-18T07:21:43Z

metrics.autoscaling.internal.knative.dev                     2024-12-18T07:21:56Z
objectcopies.s3.aws.upbound.io                               2024-12-18T07:30:07Z
objects.kubernetes.crossplane.io                             2024-12-18T07:29:57Z
objects.s3.aws.upbound.io                                    2024-12-18T07:30:07Z
observedobjectcollections.kubernetes.crossplane.io           2024-12-18T07:29:57Z

parallels.flows.knative.dev                                  2024-12-18T07:22:38Z
pingsources.sources.knative.dev                              2024-12-18T07:22:38Z
pipelineruns.tekton.dev                                      2024-12-18T07:23:11Z
pipelines.tekton.dev                                         2024-12-18T07:23:11Z
podautoscalers.autoscaling.internal.knative.dev              2024-12-18T07:21:56Z
projects.projects.argocd.crossplane.io                       2024-12-18T07:29:57Z
providerconfigs.argocd.crossplane.io                         2024-12-18T07:29:57Z
providerconfigs.aws.upbound.io                               2024-12-18T07:30:02Z
providerconfigs.helm.crossplane.io                           2024-12-18T07:29:52Z
providerconfigs.kubernetes.crossplane.io                     2024-12-18T07:29:57Z
providerconfigs.tf.upbound.io                                2024-12-18T07:29:58Z
providerconfigusages.argocd.crossplane.io                    2024-12-18T07:29:57Z
providerconfigusages.aws.upbound.io                          2024-12-18T07:30:02Z
providerconfigusages.helm.crossplane.io                      2024-12-18T07:29:52Z
providerconfigusages.kubernetes.crossplane.io                2024-12-18T07:29:57Z
providerconfigusages.tf.upbound.io                           2024-12-18T07:29:58Z
providerrevisions.pkg.crossplane.io                          2024-12-18T07:21:43Z
providers.pkg.crossplane.io                                  2024-12-18T07:21:43Z
pullthroughcacherules.ecr.aws.upbound.io                     2024-12-18T07:30:17Z
registrypolicies.ecr.aws.upbound.io                          2024-12-18T07:30:17Z
registryscanningconfigurations.ecr.aws.upbound.io            2024-12-18T07:30:17Z
releases.helm.crossplane.io                                  2024-12-18T07:29:52Z
replicationconfigurations.ecr.aws.upbound.io                 2024-12-18T07:30:17Z
repositories.ecr.aws.upbound.io                              2024-12-18T07:30:17Z
repositories.ecrpublic.aws.upbound.io                        2024-12-18T07:30:18Z
repositories.repositories.argocd.crossplane.io               2024-12-18T07:29:57Z
repositorypolicies.ecr.aws.upbound.io                        2024-12-18T07:30:17Z
repositorypolicies.ecrpublic.aws.upbound.io                  2024-12-18T07:30:18Z
resolutionrequests.resolution.tekton.dev                     2024-12-18T07:23:11Z
resourcepolicies.dynamodb.aws.upbound.io                     2024-12-18T07:30:03Z
resources.pt.fn.crossplane.io                                2024-12-18T07:41:39Z
revisions.serving.knative.dev                                2024-12-18T07:21:56Z
routes.serving.knative.dev                                   2024-12-18T07:21:56Z
sequences.flows.knative.dev                                  2024-12-18T07:22:38Z
serverlessservices.networking.internal.knative.dev           2024-12-18T07:21:56Z
services.ecs.aws.upbound.io                                  2024-12-18T07:30:16Z
services.serving.knative.dev                                 2024-12-18T07:21:56Z
sinkbindings.sources.knative.dev                             2024-12-18T07:22:38Z
stepactions.tekton.dev                                       2024-12-18T07:23:11Z
storeconfigs.aws.upbound.io                                  2024-12-18T07:30:02Z
storeconfigs.secrets.crossplane.io                           2024-12-18T07:21:43Z
storeconfigs.tf.upbound.io                                   2024-12-18T07:29:58Z
subscriptions.messaging.knative.dev                          2024-12-18T07:22:38Z
tableitems.dynamodb.aws.upbound.io                           2024-12-18T07:30:03Z
tablereplicas.dynamodb.aws.upbound.io                        2024-12-18T07:30:03Z
tables.dynamodb.aws.upbound.io                               2024-12-18T07:30:03Z
tags.dynamodb.aws.upbound.io                                 2024-12-18T07:30:03Z
taskdefinitions.ecs.aws.upbound.io                           2024-12-18T07:30:16Z
taskruns.tekton.dev                                          2024-12-18T07:23:11Z
tasks.tekton.dev                                             2024-12-18T07:23:11Z
triggerbindings.triggers.tekton.dev                          2024-12-18T07:23:23Z
triggers.eventing.knative.dev                                2024-12-18T07:22:38Z
triggers.triggers.tekton.dev                                 2024-12-18T07:23:23Z
triggertemplates.triggers.tekton.dev                         2024-12-18T07:23:23Z
usages.apiextensions.crossplane.io                           2024-12-18T07:21:42Z
verificationpolicies.tekton.dev                              2024-12-18T07:23:11Z
workspaces.tf.upbound.io                                     2024-12-18T07:29:58Z
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
