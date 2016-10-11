if [ -f ~/.secrets.sh ]; then
    . ~/.secrets.sh
fi

if [ -f ~/.env.sh ]; then
    . ~/.env.sh
fi

if [ -f ~/.aliases.sh ]; then
    . ~/.aliases.sh
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
       echo `nvm use 0.12.7`;
fi

# bin
if [ -f ~/bin/rmate ]; then
    export PATH="$PATH:$HOME/bin"
fi

export DROPLET_IP="104.236.146.16"
export DROPLET_JR_IP="159.203.241.229"
