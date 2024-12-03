.PHONY: teardown
teardown:
	@echo "\n♻️  Deleting Kubernetes cluster..."
	kind delete clusters --all
	docker system prune -a
	docker volume prune
	docker network prune
	clear

.PHONY: cluster
cluster:
	@echo "\n🔧 Creating Kubernetes cluster..."
	kind create cluster -n blanketops --config kind/kind_config.yaml
	kubectl cluster-info --context kind-blanketops
	sleep 15
	kubectl get pod -A
	clear


.PHONY: install
install:
	@echo "\n♻️  Executing install.sh..."
	 bash install.sh
	 clear

.PHONY: setup
setup:
	@echo "\n♻️  Executing install.sh..."
	 bash setup.sh
	 clear

.PHONY: all 
all: teardown cluster install setup

