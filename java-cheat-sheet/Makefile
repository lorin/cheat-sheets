.PHONY: deps

Java.docset: java.rb
	cheatset generate $<
	open $@

deps:
	bundle install
