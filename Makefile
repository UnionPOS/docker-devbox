NAME = unionpos/devbox
VERSION = 0.0.1

run:
	docker container run --attach STDOUT $(NAME):$(VERSION)

interactive:
	docker run -it $(NAME):$(VERSION) /bin/zsh

build:
	docker build -t $(NAME):$(VERSION) .

push:
	docker push $(NAME):$(VERSION)
