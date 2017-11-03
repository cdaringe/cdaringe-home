#!/bin/bash
if [ -f /etc/bashrc ]; then . /etc/bashrc; fi
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

if [ -f ~/.secrets.sh ]; then
  . ~/.secrets.sh
fi

export BACKUP_FOLDER=~/Google\ Drive/backup
export EDITOR='vim'

echo "🌲🌲🌲  ${NICKNAME:=$USER} // $OS $VER $BITS-bit ($ARCTCTR) 🌲🌲🌲"
