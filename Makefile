docker-build:
	docker build -t antroy/hello_who .
	docker push antroy/hello_who

docker-run:
	docker run -p 8000:8000 antroy/hello_who

k-build:
	kustomize build manifests/base