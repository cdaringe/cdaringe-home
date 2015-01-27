# ~/.bashrc: executed by bash(1) for non-login shells.
# for examples
# Get system data
ARCTCTR=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')

if [ -f /etc/lsb-release ]; then
    . /etc/lsb-release
    OS=$DISTRIB_ID
    VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
    OS=ubuntu  # XXX or Ubuntu??
    VER=$(cat /etc/debian_version)
elif [ -f /etc/yum.conf ]; then
    OS=centos
    VER=crappy-version
elif [ -f /bin/pacman ]; then
    OS="arch"
    VER="?"
else
    OS=$(uname -s)
    VER=$(uname -r)
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# PATH Extensions
export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:/usr/local"

# javacc
if [[ $OS == 'Darwin' ]]; then
    if [ -f "$HOME/dev/javacc-5.0/bin/javacc" ]; then
        export PATH="$PATH:$HOME/dev/javacc-5.0/bin/"
    fi
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

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

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.


if [ -f ~/.aliases.sh ]; then
    . ~/.aliases.sh
fi
if [ -f ~/.dbfuncs.sh ]; then
    . ~/.dbfuncs.sh
fi
if [ -f ~/.env.sh ]; then
    . ~/.env.sh
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

`git config --global color.ui auto`
export PATH=/usr/local/sbin:$PATH

if [[ $OS == 'Darwin' ]]; then
    export NVM_DIR="/Users/cdieringer/.nvm"
else
    export NVM_DIR="/home/cdieringer/.nvm"
fi

# nvm config
if [[ $OS == 'Darwin' ]]; then
    export NVM_DIR="/Users/cdaringe/.nvm"
else
    export NVM_DIR="/home/cdieringer/.nvm"
fi
if [ -f "$NVM_DIR/nvm.sh" ]; then
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    if [[ $OS == 'Darwin' ]]; then
        echo `nvm use 0.11.13`;
    else
        echo `nvm use 0.10.30`;
    fi
fi

# bin
if [ -f ~/bin/rmate ]; then
    export PATH="$PATH:$HOME/bin"
fi

# work
`gwa` # init grunt processes