.PHONY: deps

Go.docset: go.rb
	cheatset generate $<
	open $@

deps:
	bundle install
