#!/bin/bash
. ~/.aliases/digitalocean.sh
. ~/.aliases/docker.sh
. ~/.aliases/fileops.sh
. ~/.aliases/gatech.sh
. ~/.aliases/git.sh
. ~/.aliases/misc.sh
. ~/.aliases/node.sh
. ~/.aliases/python.sh
. ~/.aliases/system.sh
. ~/.aliases/vim.sh

if [[ $OS == 'Darwin' ]]; then
  . ~/.aliases/osx.sh
fi
