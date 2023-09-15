SHELL := cmd.exe
PATH := $(PATH);C:\Users\runneradmin\go\bin

.PHONY: test
test: bar

.PHONY: bar
bar:
	if not exist "C:\Users\runneradmin\go" md "C:\Users\runneradmin\go" && \
	go env -w GOPATH="C:\Users\runneradmin\go" && \
	go env -w GO111MODULE=on && \
	go install github.com/axw/gocov/gocov@latest && \
	go install github.com/matm/gocov-html/cmd/gocov-html@latest && \
	go install github.com/sanderhahn/gozip/cmd/gozip@latest && \
	go install github.com/vektra/mockery/v2@latest && \

.PHONY: use
use:
	mockery --version
