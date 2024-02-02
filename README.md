# Dash cheat sheets

My personal [Dash] cheat sheets

[Dash]: https://kapeli.com/dash

## Building cheatset


Building these requires [cheatset][1]. Because of an [outstanding issue][2], cheatset doesn't work on ruby 2.x

Here's what I did to get it working on my machine.


```
brew install rbenv
rbenv install 2.7.8
eval "$(rbenv init - zsh)"
gem install nokogiri -v 1.15.5
gem install cheatset
```


[1]: https://github.com/Kapeli/cheatset
[2]: https://github.com/Kapeli/cheatset/issues/42


