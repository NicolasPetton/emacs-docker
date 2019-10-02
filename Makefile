PASS_ENTRY=hub.docker.com
TAG=nicolaspetton/emacs-docker

.PHONY: all build push

all: build

# Pass --no-cache to docker-build to force new build
build:
	docker build --tag ${TAG} .

push:
	docker login --username=$$(pass-show-username.sh ${PASS_ENTRY}) --password=$$(pass-show-password.sh ${PASS_ENTRY})
	docker push ${TAG}
