
# Personal Homebrew Tap

This repository contains personal Homebrew recipes.

## How to install?

Formula, directly:

    > brew install jpalardy/tap/memora  # for example

Tap, then formula:

    > brew tap jpalardy/tap
    > brew install memora               # for example

## Update

Example:

* edit Formula/memora.rb
* upgrade version in URL
* try to install: `brew install ./Formula/memora.rb` -- watch it fail
* update sha256
* git add, commit, push

