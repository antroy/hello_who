docker-build:
	( tag=`./scripts/increment_version.sh`;  \
		docker build -t antroy/hello_who:$${tag} .; \
		docker push antroy/hello_who:$${tag} )

docker-run:
	docker run -p 8000:8000 antroy/hello_who

k-base:
	kustomize build manifests/base

k-staging:
	kustomize build manifests/staging

k-prod:
	kustomize build manifests/base
