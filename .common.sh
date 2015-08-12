if [ -f ~/.aliases.sh ]; then
    . ~/.aliases.sh
fi
if [ -f ~/.env.sh ]; then
    . ~/.env.sh
    echo "env configuration found - warning: may override sys defaults!"
fi


# git
`git config --global color.ui auto`


# nvm config
if [[ $OS == 'Darwin' ]]; then
    export NVM_DIR="/Users/$USER/.nvm"
else
    export NVM_DIR="/home/$USER/.nvm"
fi
if [ -f "$NVM_DIR/nvm.sh" ]; then
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    if [[ $OS == 'Darwin' ]]; then
        echo `nvm use 0.11.13`;
    else
       # echo `nvm use 0.10.30`;
    fi
fi


# bin
if [ -f ~/bin/rmate ]; then
    export PATH="$PATH:$HOME/bin"
fi