VERSION=v0.1.0

build-local:
	mkdir -p ./bin
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o ./bin/kubemocker main.go

build: build-local
	docker build -t xieyanke/kubemocker:$(VERSION) .

push: build
	docker push xieyanke/kubemocker:$(VERSION)

clean:
	rm -rf ./bin

clean-all: clean
	docker rmi xieyanke/kubemocker:$(VERSION)

.PHONY: build-local build push clean clean-all
