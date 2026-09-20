
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

curl -sL $(awk -F'"' '/tar.gz/ {print $2}' Formula/memora.rb) -o - | shasum -a 256

* update sha256
* git add, commit, push

