.PHONY: deps

macOS.docset: macos.rb
	cheatset generate $<
	open $@

deps:
	bundle install
