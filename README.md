
# Personal Homebrew Tap

This repository contains personal Homebrew recipes.

## How to install?

Formula, directly:

    > brew install jpalardy/tap/memora  # for example

Tap, then formula:

    > brew tap jpalardy/tap
    > brew install memora               # for example

## Update

Steps:

* edit Formula/memora.rb
* upgrade version in URL
* update sha256
* git add, commit, push

Test:
* make untap
* make tap
* make check
* make reinstall
* make untap

