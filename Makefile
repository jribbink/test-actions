UNAME := $(shell uname)

ifeq ($(OS),Windows_NT)
	GOPATH ?= $(USERPROFILE)/go
	PATH := $(PATH);$(GOPATH)/bin
else
	GOPATH ?= $(HOME)/go
	PATH := $(PATH):$(GOPATH)/bin
endif


test:
	echo "$(UNAME)"
	echo "$(PATH)"
	echo "$(GOPATH)"
	echo "$(GOROOT)"
	echo "$(GOBIN)"
	echo "$(GOFILES)"
	echo "$(GOOS)"
	echo "$(GOARCH)"
	echo "$(GOARM)"
	echo "$(GOHOSTOS)"
	echo "$(GOHOSTARCH)"
	echo "$(UNAME)"
	echo "$(USERPROFILE)"
	echo "$(PATH)"
	