# BlanketOps Environments

![Image title](images/Screenshot.png)


## Overview 🏠

- Blanketizing managed cloud resources to procure application environments of your choice.

- Build, deploy, scale, package and release from the same manifest, manage environment resources in isolation.

- Abstraction where it matters, built with GitOps and DevSecOps principles, add your customized touch.

- Procure and deploy to a set of microservices containers, depencies, pipelines, services in minutes!.

- Developement, QA and Production Environments for an application of your choice.

- Zero fault tolerant centralized and distributed secrets management.

- Need worry not about managing dockerfiles, If you do not want to ofcourse.😄

- Offering Environment types from years of research, bringing closer the necessary tools and the ideology of managing in isolation, yet in opposite from.


* Example environments/microservice/dev/microservice_environment.yaml
```
---
apiVersion: batch.blanketops.co.za/v1alpha1
kind: Environment
metadata:
  name: car-sales-web-microservices-environment
  namespace: dev
spec:
  application:
    name: car-sales-web-microservices-application
    stack:
      name: microservices
      tier:
        name: backend
        programmingLanguageName: java

  builder:
    name: car-sales-web-microservices-build
    imageToBuild: public.ecr.aws/docker/library/httpd:latest
    scheduleType: automatic

  buildPipelines:
  - name: car-sales-web-microservices-build-and-push-pipeline
    tasks:
    - name: git-clone
    - name: build-and-push-to-registry
  capacity:
    scalingOperationName: car-sales-microservices-capacity-scaling-operation
    scaling: car-sales-microservices-capacity-scaling
    scalingGroupName: car-sales-aws-autoscaling-group
    capacityProvider: car-sales-ecs-capacity-provider
    clusterCapacityProviders: car-sales-ecs-cluster-capacity-providers
  containerRegistries:
  - name: car-sales-ecr-microservice-repository
    imageTagMutability: MUTABLE
  deployment:
    name: car-sales-web-microservices-deployment
    strategy: rolling-upgrade
    scheduleType: automatic
  infrastructure:
    clusterName: car-sales-web-microservice-cluster
  location: "EU"
  microservices:
  - name: car-sales-ecs-taskdefinition-microservice
    image: 686255954747.dkr.ecr.eu-north-1.amazonaws.com/car-sales-ecr-microservice-repository:feature#hello-world
    containerPort: 80
    labels:
      app: app
      tier: microservices
    size: 1
  namespace: dev
  service:
    name: github-message-dumper
    remoteSourceCodeRepositoryLink: https://github.com/blanketops/blanketops-nginx-example.git
    remoteSourceCodeRepositorySecretName: githubsecret
    githubSourceWebhook: githubsourcesample
    eventName:
    eventListerName: car-sales-microservice-tekton-event-listener

  packageApplicationPipelines:
  - name: car-sales-web-microservices-package-pipeline

  type: microservices
```
