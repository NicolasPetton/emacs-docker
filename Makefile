.PHONY: all build

build:
	docker build -f Dockerfile .

all: build
