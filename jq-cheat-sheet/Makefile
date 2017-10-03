.PHONY: deps

jq.docset: jq.rb
	cheatset generate $<
	open $@

deps:
	bundle install
