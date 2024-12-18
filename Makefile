.PHONY: teardown
teardown:
	@echo "♻️  Deleting Kubernetes cluster..."
	kind delete clusters --all
	docker system prune -a
	docker volume prune
	docker network prune
	clear

.PHONY: cluster
cluster:
	@echo "🎓Creating Kubernetes cluster..."
	kind create cluster -n blanketops --config dependencies/kind/kind_config.yaml
	kubectl cluster-info --context kind-blanketops
	kubectl get pod -A
	clear


.PHONY: install
install:
	@echo "🔧  Executing install.sh..."
	 bash scripts/install.sh
	 clear

.PHONY: uninstall
uninstall:
	@echo "✂️ Executing uninstall.sh..."
	 bash scripts/uninstall.sh
	 clear	 

.PHONY: setup
setup:
	@echo "🚀 Executing setup.sh..."
	 bash scripts/setup.sh
	 clear

.PHONY: all 
all: uninstall teardown cluster install setup

