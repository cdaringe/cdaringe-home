# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# ZSH_THEME="random"
# ZSH_THEME="avit"
# ZSH_THEME="agnoster"
# sunaku
# ZSH_THEME="jonathan" ## great horitzontal line breaks and colors
ZSH_THEME=terminalparty ## clean git stuff to the right, no lefthand bloat. and colors

# Example aliases
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git  osx colorize mosh fasd bower node npm brew)
# zstyle ':completion:*' accept-exact '*(N)'
# zstyle ':completion:*' use-cache on
# zstyle ':completion:*' cache-path ~/.zsh/cache

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases.sh
source $HOME/.dbfuncs.sh
source $HOME/.env.sh

# User configuration

export PATH=$PATH:/usr/local
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/sbin:/usr/local/bin
export PATH=$PATH:/usr/local/lib/node_modules/karma/bin
export PATH=$PATH:$JAVA_HOME/bin:/opt/liquibase
export MANPATH="/usr/local/man:$MANPATH"


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
#
`git config --global color.ui auto`

# javacc
if [[ $OS == 'Darwin' ]]; then
    if [ -f "$HOME/dev/javacc-5.0/bin/javacc" ]; then
        export PATH="$PATH:$HOME/dev/javacc-5.0/bin/"
    fi
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
	   # echo `nvm use 0.10.30`;
	fi
fi

# python
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
if [ -f "/usr/local/bin/virtualenvwrapper.sh" ]; then
    source /usr/local/bin/virtualenvwrapper.sh
    echo "...python virtual environment loaded";
fi

#bin
if [ -f ~/bin/rmate ]; then
    export PATH="$PATH:$HOME/bin"
fi
