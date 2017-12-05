# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f ~/.shell.sh ]; then
  . ~/.shell.sh
fi


# PATH crap
export PATH="$HOME/.cargo/bin:$PATH"
export ANDROID_HOME="/Users/cdieringer/Library/Android/sdk"
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH="/usr/local/bin:$PATH"

. ~/.aliases/.aliases.sh
. ~/.common.sh
. ~/.work.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
