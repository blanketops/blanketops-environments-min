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
   echo "----------------------------------------------------------------------------------------------------------------------------------------"
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

   kubectl patch crd/environments.batch.blanketops.co.za                         -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/eventlisteners.triggers.tekton.dev                          -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/eventpolicies.eventing.knative.dev                          -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/eventtypes.eventing.knative.dev                             -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/extensions.dashboard.tekton.dev                             -p '{"metadata":{"finalizers":[]}}' --type=merge

   kubectl patch crd/functionrevisions.pkg.crossplane.io                         -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/functions.pkg.crossplane.io                                 -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/githubbindings.bindings.knative.dev                         -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/githubsources.sources.knative.dev                           -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/globaltables.dynamodb.aws.upbound.io                        -p '{"metadata":{"finalizers":[]}}' --type=merge

   kubectl patch crd/imageconfigs.pkg.crossplane.io                              -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/images.caching.internal.knative.dev                         -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/ingresses.networking.internal.knative.dev                   -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/interceptors.triggers.tekton.dev                            -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/ipaddresspools.metallb.io                                   -p '{"metadata":{"finalizers":[]}}' --type=merge

   kubectl patch crd/jobsinks.sinks.knative.dev                                  -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/kinesisstreamingdestinations.dynamodb.aws.upbound.io        -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/l2advertisements.metallb.io                                 -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/lifecyclepolicies.ecr.aws.upbound.io                        -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/locks.pkg.crossplane.io                                     -p '{"metadata":{"finalizers":[]}}' --type=merge

   kubectl patch crd/metrics.autoscaling.internal.knative.dev                    -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/objectcopies.s3.aws.upbound.io                              -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/objects.kubernetes.crossplane.io                            -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/objects.s3.aws.upbound.io                                   -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/observedobjectcollections.kubernetes.crossplane.io          -p '{"metadata":{"finalizers":[]}}' --type=merge

   kubectl patch crd/parallels.flows.knative.dev                                 -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/pingsources.sources.knative.dev                             -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/pipelineruns.tekton.dev                                     -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/pipelines.tekton.dev                                        -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/podautoscalers.autoscaling.internal.knative.dev             -p '{"metadata":{"finalizers":[]}}' --type=merge

   kubectl patch crd/projects.projects.argocd.crossplane.io                      -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/providerconfigs.argocd.crossplane.io                        -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/providerconfigs.aws.upbound.io                              -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/providerconfigs.helm.crossplane.io                          -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/providerconfigs.kubernetes.crossplane.io                    -p '{"metadata":{"finalizers":[]}}' --type=merge

   kubectl patch crd/providerconfigs.tf.upbound.io                               -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/providerconfigusages.argocd.crossplane.io                   -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/providerconfigusages.aws.upbound.io                         -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/providerconfigusages.helm.crossplane.io                     -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/providerconfigusages.kubernetes.crossplane.io               -p '{"metadata":{"finalizers":[]}}' --type=merge

   kubectl patch crd/providerconfigusages.tf.upbound.io                          -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/providerrevisions.pkg.crossplane.io                         -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/providers.pkg.crossplane.io                                 -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/pullthroughcacherules.ecr.aws.upbound.io                    -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/registrypolicies.ecr.aws.upbound.io                         -p '{"metadata":{"finalizers":[]}}' --type=merge

   kubectl patch crd/registryscanningconfigurations.ecr.aws.upbound.io           -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/releases.helm.crossplane.io                                 -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/replicationconfigurations.ecr.aws.upbound.io                -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/repositories.ecr.aws.upbound.io                             -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/repositories.ecrpublic.aws.upbound.io                       -p '{"metadata":{"finalizers":[]}}' --type=merge

   kubectl patch crd/repositories.repositories.argocd.crossplane.io              -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/repositorypolicies.ecr.aws.upbound.io                       -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/repositorypolicies.ecrpublic.aws.upbound.io                 -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/resolutionrequests.resolution.tekton.dev                    -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/resourcepolicies.dynamodb.aws.upbound.io                    -p '{"metadata":{"finalizers":[]}}' --type=merge

   kubectl patch crd/resources.pt.fn.crossplane.io                               -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/revisions.serving.knative.dev                               -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/routes.serving.knative.dev                                  -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/sequences.flows.knative.dev                                 -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/serverlessservices.networking.internal.knative.dev          -p '{"metadata":{"finalizers":[]}}' --type=merge

   kubectl patch crd/services.ecs.aws.upbound.io                                 -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/services.serving.knative.dev                                -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/sinkbindings.sources.knative.dev                            -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/stepactions.tekton.dev                                      -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/storeconfigs.aws.upbound.io                                 -p '{"metadata":{"finalizers":[]}}' --type=merge

   kubectl patch crd/storeconfigs.secrets.crossplane.io                          -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/storeconfigs.tf.upbound.io                                  -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/subscriptions.messaging.knative.dev                         -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/tableitems.dynamodb.aws.upbound.io                          -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/tablereplicas.dynamodb.aws.upbound.io                       -p '{"metadata":{"finalizers":[]}}' --type=merge

   kubectl patch crd/tables.dynamodb.aws.upbound.io                              -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/tags.dynamodb.aws.upbound.io                                -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/taskdefinitions.ecs.aws.upbound.io                          -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/taskruns.tekton.dev                                         -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/tasks.tekton.dev                                            -p '{"metadata":{"finalizers":[]}}' --type=merge

   kubectl patch crd/triggerbindings.triggers.tekton.dev                         -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/triggers.eventing.knative.dev                               -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/triggers.triggers.tekton.dev                                -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/triggertemplates.triggers.tekton.dev                        -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/usages.apiextensions.crossplane.io                          -p '{"metadata":{"finalizers":[]}}' --type=merge

   kubectl patch crd/verificationpolicies.tekton.dev                             -p '{"metadata":{"finalizers":[]}}' --type=merge
   kubectl patch crd/workspaces.tf.upbound.io                                    -p '{"metadata":{"finalizers":[]}}' --type=merge

   
   echo "---------------------------------------------------------"
   echo "Complete!"
   echo "----------------------------------------------------------------------------------"
   echo "Waiting for Next Instructions!...."
   sleep 10
   clear

   echo " Teardown the Silenced Resources!--------------------------------------------------------------------------------------------------------"
   echo "----------------------------------------------------------------------------------------------------------------------------------------"
   kubectl delete accountsettingdefaults.ecs.aws.upbound.io                      --all
   kubectl delete addresspools.metallb.io                                        --all
   kubectl delete apiserversources.sources.knative.dev                           --all
   kubectl delete applications.applications.argocd.crossplane.io                 --all
   kubectl delete appprojects.argoproj.io                                        --all

   kubectl delete applicationsets.applicationsets.argocd.crossplane.io           --all
   kubectl delete applicationsets.argoproj.io                                    --all
   kubectl delete appprojects.argoproj.io                                        --all
   kubectl delete bfdprofiles.metallb.io                                         --all
   kubectl delete bgpadvertisements.metallb.io                                   --all

   kubectl delete bgppeers.metallb.io                                            --all
   kubectl delete brokers.eventing.knative.dev                                   --all
   kubectl delete bucketacls.s3.aws.upbound.io                                   --all
   kubectl delete bfdprofiles.metallb.io                                         --all
   kubectl delete bucketanalyticsconfigurations.s3.aws.upbound.io                --all

   kubectl delete bucketcorsconfigurations.s3.aws.upbound.io                     --all
   kubectl delete bucketintelligenttieringconfigurations.s3.aws.upbound.io       --all
   kubectl delete bucketinventories.s3.aws.upbound.io                            --all
   kubectl delete bucketlifecycleconfigurations.s3.aws.upbound.io                --all
   kubectl delete bucketloggings.s3.aws.upbound.io                               --all

   kubectl delete bucketmetrics.s3.aws.upbound.io                                --all
   kubectl delete bucketnotifications.s3.aws.upbound.io                          --all
   kubectl delete bucketobjectlockconfigurations.s3.aws.upbound.io               --all
   kubectl delete bucketobjects.s3.aws.upbound.io                                --all
   kubectl delete bucketownershipcontrols.s3.aws.upbound.io                      --all

   kubectl delete bucketpolicies.s3.aws.upbound.io                               --all
   kubectl delete bucketpublicaccessblocks.s3.aws.upbound.io                     --all
   kubectl delete bucketreplicationconfigurations.s3.aws.upbound.io              --all
   kubectl delete bucketrequestpaymentconfigurations.s3.aws.upbound.io           --all
   kubectl delete buckets.s3.aws.upbound.io                                      --all

   kubectl delete bucketserversideencryptionconfigurations.s3.aws.upbound.io     --all
   kubectl delete bucketversionings.s3.aws.upbound.io                            --all
   kubectl delete bucketwebsiteconfigurations.s3.aws.upbound.io                  --all
   kubectl delete capacityproviders.ecs.aws.upbound.io                           --all
   kubectl delete certificates.networking.internal.knative.dev                   --all

   kubectl delete channels.messaging.knative.dev                                 --all
   kubectl delete clustercapacityproviders.ecs.aws.upbound.io                    --all
   kubectl delete clusterdomainclaims.networking.internal.knative.dev            --all
   kubectl delete clusterinterceptors.triggers.tekton.dev                        --all
   kubectl delete clusters.cluster.argocd.crossplane.io                          --all

   kubectl delete clusters.ecs.aws.upbound.io                                    --all
   kubectl delete clustertasks.tekton.dev                                        --all
   kubectl delete clustertriggerbindings.triggers.tekton.dev                     --all
   kubectl delete communities.metallb.io                                         --all
   kubectl delete compositeresourcedefinitions.apiextensions.crossplane.io       --all 

   kubectl delete compositionrevisions.apiextensions.crossplane.io               --all
   kubectl delete compositions.apiextensions.crossplane.io                       --all
   kubectl delete configurationrevisions.pkg.crossplane.io                       --all
   kubectl delete configurations.pkg.crossplane.io                               --all
   kubectl delete configurations.serving.knative.dev                             --all 

   kubectl delete containersources.sources.knative.dev                           --all
   kubectl delete contributorinsights.dynamodb.aws.upbound.io                    --all
   kubectl delete controllerconfigs.pkg.crossplane.io                            --all
   kubectl delete customruns.tekton.dev                                          --all
   kubectl delete deploymentruntimeconfigs.pkg.crossplane.io                     --all 

   kubectl delete directorybuckets.s3.aws.upbound.io                             --all
   kubectl delete domainmappings.serving.knative.dev                             --all
   kubectl delete environmentclaim.batch.blanketops.co.za                        --all
   kubectl delete environmentconfigs.apiextensions.crossplane.io                 --all
   kubectl delete environments.batch.blanketops.co.za                            --all 

   kubectl delete eventlisteners.triggers.tekton.dev                             --all
   kubectl delete eventpolicies.eventing.knative.dev                             --all
   kubectl delete eventtypes.eventing.knative.dev                                --all
   kubectl delete extensions.dashboard.tekton.dev                                --all
   kubectl delete functionrevisions.pkg.crossplane.io o                          --all 

   kubectl delete functions.pkg.crossplane.io                                    --all
   kubectl delete githubbindings.bindings.knative.dev                            --all
   kubectl delete githubsources.sources.knative.dev                              --all
   kubectl delete globaltables.dynamodb.aws.upbound.io                           --all
   kubectl delete imageconfigs.pkg.crossplane.io                                 --all 

   kubectl delete images.caching.internal.knative.dev                            --all
   kubectl delete ingresses.networking.internal.knative.dev                      --all
   kubectl delete interceptors.triggers.tekton.dev                               --all
   kubectl delete ipaddresspools.metallb.io                                      --all
   kubectl delete jobsinks.sinks.knative.dev                                     --all 

   kubectl delete kinesisstreamingdestinations.dynamodb.aws.upbound.io           --all
   kubectl delete l2advertisements.metallb.io                                    --all
   kubectl delete lifecyclepolicies.ecr.aws.upbound.io                           --all
   kubectl delete locks.pkg.crossplane.io                                        --all
   kubectl delete metrics.autoscaling.internal.knative.dev                       --all 

   kubectl delete objectcopies.s3.aws.upbound.io                                 --all
   kubectl delete objects.kubernetes.crossplane.io                               --all
   kubectl delete objects.s3.aws.upbound.io                                      --all
   kubectl delete observedobjectcollections.kubernetes.crossplane.io             --all
   kubectl delete parallels.flows.knative.dev                                    --all 

   kubectl delete pingsources.sources.knative.dev                                --all
   kubectl delete pipelineruns.tekton.dev                                        --all
   kubectl delete pipelines.tekton.dev                                           --all
   kubectl delete podautoscalers.autoscaling.internal.knative.dev                --all
   kubectl delete projects.projects.argocd.crossplane.io                         --all 

   kubectl delete providerconfigs.argocd.crossplane.io                           --all
   kubectl delete providerconfigs.aws.upbound.io                                 --all
   kubectl delete providerconfigs.helm.crossplane.io                             --all
   kubectl delete providerconfigs.kubernetes.crossplane.io                       --all
   kubectl delete providerconfigs.tf.upbound.io                                  --all 

   kubectl delete providerconfigusages.argocd.crossplane.io                      --all
   kubectl delete providerconfigusages.aws.upbound.io                            --all
   kubectl delete providerconfigusages.helm.crossplane.io                        --all
   kubectl delete providerconfigusages.kubernetes.crossplane.io                  --all
   kubectl delete providerconfigusages.tf.upbound.io                             --all 

   kubectl delete providerrevisions.pkg.crossplane.io                            --all
   kubectl delete providers.pkg.crossplane.io                                    --all
   kubectl delete pullthroughcacherules.ecr.aws.upbound.io                       --all
   kubectl delete registrypolicies.ecr.aws.upbound.io                            --all
   kubectl delete registryscanningconfigurations.ecr.aws.upbound.io              --all 

   kubectl delete releases.helm.crossplane.io                                    --all
   kubectl delete replicationconfigurations.ecr.aws.upbound.io                   --all
   kubectl delete repositories.ecr.aws.upbound.io                                --all
   kubectl delete repositories.ecrpublic.aws.upbound.io                          --all
   kubectl delete repositories.repositories.argocd.crossplane.io                 --all 

   kubectl delete repositorypolicies.ecr.aws.upbound.io                          --all
   kubectl delete repositorypolicies.ecrpublic.aws.upbound.io                    --all
   kubectl delete resolutionrequests.resolution.tekton.dev                       --all
   kubectl delete resourcepolicies.dynamodb.aws.upbound.io                       --all
   kubectl delete resources.pt.fn.crossplane.io                                  --all 

   kubectl delete revisions.serving.knative.dev                                  --all
   kubectl delete routes.serving.knative.dev                                     --all
   kubectl delete sequences.flows.knative.dev                                    --all
   kubectl delete serverlessservices.networking.internal.knative.dev             --all
   kubectl delete services.ecs.aws.upbound.io                                    --all 

   kubectl delete services.serving.knative.dev                                   --all
   kubectl delete sinkbindings.sources.knative.dev                               --all
   kubectl delete stepactions.tekton.dev                                         --all
   kubectl delete storeconfigs.aws.upbound.io                                    --all
   kubectl delete storeconfigs.secrets.crossplane.io                             --all 

   kubectl delete storeconfigs.tf.upbound.io                                     --all
   kubectl delete subscriptions.messaging.knative.dev                            --all
   kubectl delete tableitems.dynamodb.aws.upbound.io                             --all
   kubectl delete tablereplicas.dynamodb.aws.upbound.io                          --all
   kubectl delete tables.dynamodb.aws.upbound.io                                 --all 

   kubectl delete tags.dynamodb.aws.upbound.io                                   --all
   kubectl delete triggertemplates.triggers.tekton.dev                           --all
   kubectl delete tasks.tekton.dev                                               --all
   kubectl delete triggerbindings.triggers.tekton.dev                            --all 

   kubectl delete triggers.eventing.knative.dev                                  --all
   kubectl delete triggers.triggers.tekton.dev                                   --all
   kubectl delete verificationpolicies.tekton.dev                                --all
   kubectl delete usages.apiextensions.crossplane.io                             --all
   kubectl delete workspaces.tf.upbound.io                                       --all

   echo "------------------------------------------------------------------------------------------------------------------"
   echo "Deleting Namespaces"
   echo "------------------------------------------------------------------------------------------------------------------" 
   kubectl delete namespaces                                                     --all --force
   echo "--------------------------------------------------------------------------------------------------------------------"
   clear

   helm repo remove localstack-charts
   helm repo remove crossplane-stable
   echo "-----------------------------------------------------------------------------------------------------------------------"
}

function_uninstall
