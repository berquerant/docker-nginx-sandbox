run: build
	docker compose up

IMAGE_NAME = "docker-nginx-sandbox-api"
SANDBOX_TAG = "latest"
SANDBOX_IMAGE = $(IMAGE_NAME):$(SANDBOX_TAG)
SANDBOX_DOCKERFILE = Dockerfile

build: sandbox

lint: docker-hadolint-debian

sandbox: $(SANDBOX_DOCKERFILE)
	docker build --tag $(SANDBOX_IMAGE) -f $< .

HADOLINT_IMAGE = hadolint/hadolint:v2.12.0-debian

.PHONY: docker-hadolint-debian
docker-hadolint-debian:
	docker run --rm -i -v $(PWD)/.hadolint.yml:/.config/hadolint.yml $(HADOLINT_IMAGE) hadolint --config /.config/hadolint.yml - < $(SANDBOX_DOCKERFILE)
