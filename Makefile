SHELL := cmd.exe

.PHONY: test
test: foo bar foo bar

.PHONY: foo
foo:
	echo "foo" && exit 1

.PHONY: bar
bar:
	echo "bar"