.PHONY: deps

Git.docset: git.rb
	cheatset generate $<
	open $@

deps:
	bundle install
