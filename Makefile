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
	kind create cluster -n blanketops --config dependencies/kind/kind_config.yaml
	kubectl cluster-info --context kind-blanketops
	sleep 15
	kubectl get pod -A
	clear


.PHONY: install
install:
	@echo "\n♻️  Executing install.sh..."
	 bash scripts/install.sh
	 clear

.PHONY: uninstall
uninstall:
	@echo "\n♻️  Executing uninstall.sh..."
	 bash scripts/uninstall.sh
	 clear	 

.PHONY: setup
setup:
	@echo "\n♻️  Executing setup.sh..."
	 bash scripts/setup.sh
	 clear

.PHONY: all 
all: uninstall teardown cluster install setup

