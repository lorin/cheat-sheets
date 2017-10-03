.PHONY: deps

vim.docset: vim.rb
	cheatset generate $<
	open $@

deps:
	bundle install
