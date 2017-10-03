.PHONY: deps

Pandas.docset: pandas.rb
	cheatset generate $<
	open $@

deps:
	bundle install
