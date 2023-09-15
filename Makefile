# Set OS-related environment variables
ifeq ($(OS),Windows_NT)
	SHELL := cmd.exe
	GOPATH ?= $(USERPROFILE)\go
	PATH := $(PATH);$(GOPATH)\bin
	MKDIR_GOPATH := if not exist "$(GOPATH)" md "$(GOPATH)"
	SET_GOPATH := go env -w GOPATH="$(GOPATH)"
	SET_GO111MODULE := go env -w GO111MODULE=on
	SET_CGO_DISABLED := go env -w CGO_ENABLED=0
else
	SHELL := /bin/bash
	GOPATH ?= $(HOME)/go
	PATH := $(PATH):$(GOPATH)/bin
	MKDIR_GOPATH := mkdir -p "$(GOPATH)"
	SET_GOPATH := export GOPATH="$(GOPATH)"
	SET_GO111MODULE := export GO111MODULE=on
	SET_CGO_DISABLED := export CGO_ENABLED=0
endif

.PHONY: test
test: bar use

.PHONY: bar
bar:
	$(MKDIR_GOPATH) && \
	$(SET_GOPATH) && \
	$(SET_GO111MODULE) && \
	go install github.com/axw/gocov/gocov@latest && \
	go install github.com/matm/gocov-html/cmd/gocov-html@latest && \
	go install github.com/sanderhahn/gozip/cmd/gozip@latest && \
	go install github.com/vektra/mockery/v2@latest

.PHONY: use
use:
	echo %PATH% && dir $(GOPATH) && \
	$(SET_GOPATH) && \
	mockery --version && \
	echo $(GOPATH) && \
	echo $(PATH)
