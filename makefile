IMAGE_NAME = $(shell grep '^ \+\[ name:' Jenkinsfile | cut -d"'" -f2)

default:
	@echo No

build:
	@docker build -t $(IMAGE_NAME) .
