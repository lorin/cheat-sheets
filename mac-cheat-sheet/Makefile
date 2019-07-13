.PHONY: deps

mac.docset: mac.rb
	cheatset generate $<
	open $@

deps:
	bundle install
