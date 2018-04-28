export DOCKER_IMAGE ?= oleggorj/$(APP)
export DOCKER_TAG ?= dev
export DOCKER_IMAGE_NAME ?= $(DOCKER_IMAGE):$(DOCKER_TAG)
export DOCKER_BUILD_FLAGS =

run:
	ssh-keygen -R '[localhost]:1234'
	docker run -it -p1234:22 \
		-v ~/.ssh/:/root/.ssh/ \
		--env-file=../.secrets \
		--env-file=../.duo \
		-e MFA_PROVIDER=google-authenticator \
		-e SLACK_ENABLED=true \
		--entrypoint=/bin/bash $(DOCKER_IMAGE_NAME)
