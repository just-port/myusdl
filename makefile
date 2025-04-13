# Check to see if we can use ash, in Alpine images, default to bash
SHELL_PATH = /bin/ash
SHELL = $(if $(wildcard $(SHELL_PATH)),/bin/ash,/bin/bash)

# ==============================================================================
# Chat

chat-run:
	go run ./chat/api/services/cap/main.go | go run ./chat/api/tooling/logfmt/main.go

# ==============================================================================
# Modules Support

tidy:
	go mod tidy
	go mod vendor

deps-upgrade:
	go get -u -v ./...
	go mod tidy
	go mod vendor

