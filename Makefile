.PHONY: install
install:
	@echo "\n♻️  Executing install.sh..."
	 bash install.sh

.PHONY: cluster
kind-cluster:
	@echo "\n🔧 Creating Kubernetes cluster..."
	kind create cluster -n blanketops --config kind/kind_config.yaml
	kubectl cluster-info --context kind-blanketops
	sleep 60
	kubectl get pod -A

.PHONY: destroy-cluster
delete-cluster:
	@echo "\n♻️  Deleting Kubernetes cluster..."
	kind delete clusters --all
	docker system prune -a
	docker volume prune
	docker network prune
