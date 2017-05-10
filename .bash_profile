#!/bin/bash
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi 
if [ -f /etc/bashrc ]; then
 . /etc/bashrc
fi

# PATH Extensions
export PATH="/usr/local/bin:$PATH"

# shell
export CLICOLOR=1
color_prompt=yes
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
export GOPATH=$HOME/src/go

## tripcity
# default,
#PS1=\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$
if grep -Fq "npm-e" ~/.npmrc
then
    ICON="🚨 🌎"
elif grep -Fq "npm-t" ~/.npmrc
then
    ICON="🚨 🎌️"
elif grep -Fq "npm-l" ~/.npmrc
then
    ICON="🚨 ☠️"
else
    ICON=🛰
fi

# title
# bold \[\033[01;32m\]
# normal thickness \[\033[00m\]
PS1="\[\e]0;\w\a\]\[\033[01;32m\]\u@\h\[\033[00m\] $ICON  \W\$ "


# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
