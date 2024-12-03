.PHONY: main
main:
	@echo "\n♻️  Executing main.sh..."
	 bash main.sh


.PHONY: build
build:
	@echo "\n🔧  Building Go binaries..."
	GOOS=darwin GOARCH=amd64 go build -o bin/blanket-ops-iac-darwin-amd64 .
	GOOS=linux GOARCH=amd64 go build -o bin/blanket-ops-iac-linux-amd64 .

.PHONY: docker-build
docker-build:
	@echo "\n📦 Building blanket-ops-iac Docker image..."
	docker build -t blanket-ops-iac:latest .

# From this point `kind` is required
.PHONY: kind-cluster
kind-cluster:
	@echo "\n🔧 Creating Kubernetes cluster..."
	kind create cluster -n blanketops --config kind/kind_config.yaml
	kubectl cluster-info --context kind-blanketops
	sleep 60
	kubectl get pod -A

.PHONY: delete-cluster
delete-cluster:
	@echo "\n♻️  Deleting Kubernetes cluster..."
	kind delete clusters --all
	docker system prune -a
	docker volume prune
	docker network prune
