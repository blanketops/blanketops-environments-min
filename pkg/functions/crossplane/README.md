# BlanketOps Operator Cloud Native Functions

## Structure layout

```
1. Crossplane : For Cloud Provider Managed Resources, in our case, AWS(ecs,ec2,ecr,s3,helm,argo)
   - Environment
        application: dynamodb
                 key: name ,value: car-sales-web-microservice-application
                 key: namespace,value: dev
                 key: tiername,value: backend
                 key: programmingLanguageName,value: c#
                 key: stackname,value: microservices

        containerRegistries: ecr registry
                           - name: blanketops-ecr-microservice-repository
                             imageTagMutability: MUTABLE
                             region: eu-north-1

        capacity: ecs autoscaling
                  scalingOperationName: blanketops-microservices-capacity-scaling-operation
                  scaling: blanketops-microservices-capacity-scaling
                  scalinggroupname: blanketops-aws-autoscaling-group

        deployment: ecs service
                    name: microservices
                    type: canary
                    clusterName: blanketops-ecs-cluster
                    scheduletype: manual

        infrastructure: ecs cluster   
                        clusterName: blanketops-ecs-cluster
                        region: eu-north-1
                        capacityProvider: blanketops-ecs-capacity-provider
                        capacityProviders: blanketops-ecs-capacity-providers
                                 
        microservices item: ecs taskdefinition
                           - name: car-sales-web-microservice
                             image: 686255954747.dkr.ecr.eu-north-1.amazonaws.com/blanketops-ecr-microservice-repository:main
                             labels:
                               app: app
                             tier: microservices
                             size: 1
                             containerDefinitions: |-
                               [
                                 {
                                   "name": "microservice",
                                   "image": "686255954747.dkr.ecr.eu-north-1.amazonaws.com/blanketops-crossplane-ecr-microservice-repository:develop",
                                   "cpu": 12,
                                   "memory": 512,
                                   "essential":true
                                 }
                              ]   
                             family: blanketops-ecs-cluster
                             region: eu-north-1
        # can this be with svc file to s3 bucket
        release: helm chart release
                 name: microservice release 1
                 isRelease: true
                 dateReleased: 04/09/2024
                 deployedBranch: origin/main
                 rollback:
                   releaseName: microservice release 1
                   isEnabled: false
                   releaseTag: v0.1.0
                 chart:
                   name: microservice
                   repository: https://github.com/blanketops/blanketops-nginx-example.git 
                   version: 0.1.0  
                 namespace: dev
                  set:
                  - name: param1
                    value: value2
                  values:
                    service:
                      type: ClusterIP
                 providerConfigRef:
                   name: helm-provider
                 
                 
                   

                             
        
                       
                       


2. KNative : As a Manager for Developer interaction with remote repository, in our case, Github,
   -  for DevOps Engineers to create and maintain pipelines, 
```