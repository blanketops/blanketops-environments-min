# BlanketOps Environments

![Image title](images/Screenshot.png)


## Overview 🏠

- Blanketizing managed cloud resources to procure application environments of your choice.

- Build, deploy, scale, package and release from the same manifest, manage environment resources in isolation.

- Abstraction where it matters, built with GitOps and DevSecOps principles, add your customized touch.

- Procure and deploy to a set of microservices containers, depencies, pipelines, and services.

- Developement, QA and Production Environments for an application of your choice.

- CD/CI Pipelines fully and or partially automated through rules you setup.

- Zero fault tolerant centralized and distributed secrets management.

- Need worry not about managing dockerfiles, If you do not want to ofcourse.😄

- Offering Environment types from years of research, bringing closer the necessary tools to manage multiple application resources as a single unit.
  From Microservices, single stack, mobile crossplatform, native, Lmamp-Wamp.

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
    image: <aws-account-id>.dkr.ecr.eu-north-1.amazonaws.com/car-sales-ecr-microservice-repository:feature#hello-world
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
    eventName: pull_request
    eventListerName: car-sales-microservice-tekton-event-listener
  packageApplicationPipelines:
  - name: car-sales-web-microservices-package-pipeline
  type: microservices
```
- That was a lot of yaml, but we have achieved the following!



## Authors
- [@blanketops](https://github.com/nkanyezi-solutions)

## Acknowledgements
- [NimboStack](https://nimbostack.com)
- [Crossplane](https://www.crossplane.io/)
- [ArgoCD](https://argo-cd.readthedocs.io/en/stable/)
- [KNative](https://knative.dev/docs/)
- [Helm](https://helm.sh/)
- [Carvel](https://carvel.dev/kapp/)
- [Tekton](https://tekton.dev/)

## Features
- Light/dark mode toggle
- Live previews
- Fullscreen mode
- Cross platform

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)
[![GPLv3 License](https://img.shields.io/badge/License-GPL%20v3-yellow.svg)](https://opensource.org/licenses/)
[![AGPL License](https://img.shields.io/badge/license-AGPL-blue.svg)](http://www.gnu.org/licenses/agpl-3.0)



