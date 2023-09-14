SHELL := cmd.exe
PATH := $(PATH):C:\Foo\Bar

.PHONY: test
test: bar

.PHONY: bar
bar:
	echo "bar"