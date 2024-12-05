# BlanketOps Environments

![Image title](images/Screenshot.png)

BlanketOps aims to revolutionarize the rise of DevOps through extensive customization of cloud native resources tailored for your organization's needs.


## Overview

Blanket Ops Environments is Internal developer platform for organizations and startups to quickly setup resources in the cloud following a DevOps Model by leveraging our kubernetes custom api.

A platform agnostic system that communicates with cloud providers you register for(support only for AWS in this release), to create,update,view and delete resources, as compositions or exacts of cloud services. Container Registries, Releases, custom Environments,Pipelines,Processes and Deployments from years of research following industry best practices.

## Prerequisites

* `Make`    : Makefile execution
* `Kubectl` : Interact with cluster of choice
* `Helm`    : Manage Packaged Resources
* `BlanketOps` : BlanketOps offerings

## Commands

* `make cluster`  - Create a Kind cluster locally .
* `make install`  - Install BlanketOps manifests.
* `make services` - Interact with BlanketOps Enviroments
* `make setup`    - Setup and execute HealthChecks on the BlanketOps installed manifests.
* `make teardown` - Delete Kind cluster and docker prune resources.
* `make -h`       - Learn more about BlanketOps Commands, Subcommands and Flags.


## CLI Commands

* `blanketops auth`   - Authentication management to cli.
* `blanketops environments` -  Interact with environments.
* `blanketops --h  ` -  View more information about commands, subcommands and flags.

## CLI SubCommands

<!-- ## Project layout

    mkdocs.yml    # The configuration file.
    docs/
        index.md  # The documentation homepage.
        ...       # Other markdown pages, images and other files. -->