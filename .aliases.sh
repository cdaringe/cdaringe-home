#!/bin/bash

# dirty-windows-bash
alias twsrc="cd /c/Users/Cdieringer/Documents/src"

# config
export EDITOR='vim' #default
alias dbmap="sudo $EDITOR /coins/config/dbmap.json"
alias gobash="chsh -s $(which bash) $USER"
alias getsecrets="scp devcoin4:~/.secrets.sh ~/"
alias sed-replace="echo \"sed -i '' 's/::find::/::replace::/' **/*.js\""

# sys
alias sudoers="sudo vim /etc/sudoers"
alias useradd="echo \"Did you mean to perform adduser?\""
alias shasum="sha1sum"
alias backupdroplet="rsync -avz $DROPLET_IP:/www/ ~/Dropbox/backup/www && rsync -avz --exclude-from '/Users/cdieringer/Dropbox/backup/exclude-ghost.txt' $DROPLET_IP:/ghost/ ~/Dropbox/backup/ghost && rsync -avz $DROPLET_IP:/data/rethinkdb/ ~/Dropbox/backup/rethinkdb"

# apps
alias couch2="~/dev/couchdb/dev/run"
alias couch2proxy="haproxy -f ~/dev/couchdb/rel/haproxy.cfg"
alias s.="sublime ."
alias a.="atom ."

alias node4="/usr/local/n/versions/node/4.4.3/bin/node"
alias npm2="/usr/local/n/versions/node/4.4.3/bin/npm"
alias pruny="npm prune && npm install"

# file  
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias purgedir="rm -rf .* *"
alias purgeswap="rm -rf ~/.vim/swapfiles"
alias home="cd ~"
export webroot="/var/www/html"
alias www="cd $webroot"
alias ba="cc && cd js/browserApp"
alias cas="cd $webroot/cas"
alias cc="cd $webroot/coins_core"
alias amp="cc;cd js/browserApp/ampersand;"
alias mic="cd $webroot/micis"
alias micis="mic"
alias dbs="cd ~/db_schema"
alias p2="cd $webroot/p2"
alias asmt="cd $webroot/micis/asmt"
alias oCoins="cd $webroot/oCoins/app"
alias ocoins="oCoins"
alias cui="cd ~/node/coinstac-ui"
alias ccm="cd ~/node/coinstac-common"
alias ccc="cd ~/node/coinstac-client-core"
alias uo="(ocoins;grunt;)"
alias portals="cd $webroot/portals"
alias qb="cd ~/node/quarterback"
alias sp="qb && cd packages/steelpenny"
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

## database
alias pglogon="sudo -u postgres psql"

## remote
alias ct="ssh coinstraining.mrn.org"
alias dc="ssh devcoin4.mrn.org"
alias oc="ssh opscoin.mind.unm.edu"
alias ops="cd /coins/ansible-ops"
alias lcd="cd /coins/localcoin"
alias lcdc="cd /coins/localcoin/coins/www/html"
alias lc="ssh $USER@localhost -p 2222" # localcoin logon!
droplet () { ssh "$DROPLET_IP"; }

alias rmateclog="echo 'Kill process using 52698 (kill ###)'; sudo netstat -antpl  | grep 52698"

# git
alias gs="git status"
alias gpm="git pull origin master"
alias gpd="git pull origin develop"
alias gpushd="git push origin develop"
alias gpush="git push origin $1";
alias gp="git pull"
alias gl="git log"
alias gcm="git commit -am $1"
alias gbl="git branch --list"
alias gba="git branch --list -a"
alias gc="git checkout"
alias gcb='git checkout -b'
alias gcd='git checkout develop'
alias gcr='git checkout release'
alias gcm='git checkout master'
alias gd='git diff --ignore-space-change --ignore-all-space'
alias gh="git config --get remote.origin.url"

ballervim () {
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim && \
    cd ~/.vim/bundle && \
    rm -rf vim-colors-solarized && git clone git://github.com/altercation/vim-colors-solarized.git && \
    rm -rf syntastic && git clone https://github.com/scrooloose/syntastic.git && \
    rm -rf vdebug && git clone git@github.com:joonty/vdebug.git
}
alias git-config-cdaringe="git config --global user.name cdaringe && git config --global user.email christopher.dieringer@gmail.com && git config --global core.editor vim && git config --global push.default current"
alias git-config-gatech="git config --global user.name cdieringer3 && git config --global user.email cdieringer3@gatech.edu && git config --global core.editor vim && git config --global push.default current"

## compression
alias untar="tar -xvf $1"

#** SERVER **#
alias syslog="$EDITOR /var/log/syslog"
alias ports="sudo netstat -plunt"

if [[ $OS == 'centos' ]]; then
    #php
    alias phpini="sudo $EDITOR /etc/php.ini"

elif [[ $OS == 'Darwin' ]]; then
    if [ -f "/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl" ]
        then
        alias sublime="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
        alias subl="sublime"
    fi

    ## osx only
    alias showhidden="defaults write com.apple.finder AppleShowAllFiles -boolean true ; killall Finder"
    alias hidehidden="defaults write com.apple.finder AppleShowAllFiles -boolean false ; killall Finder"
    alias dsoff="defaults write com.apple.desktopservices DSDontWriteNetworkStores true"
    alias dson="defaults write com.apple.desktopservices DSDontWriteNetworkStores false"

    adduser() {
        sudo dseditgroup -o edit -a $1 -t user $2
    }

    export PATH=/home/$USER/node/selenium_drvers_osx/:$PATH
fi

# vim
alias vimrc="$EDITOR ~/.vimrc"
alias aliases="$EDITOR ~/.aliases.sh"
alias secrets="$EDITOR ~/.secrets.sh"
alias ualiases="(cd ~;git add ~/.aliases.sh; git commit -m 'aliases updated';git push origin master;sourceme)"
alias dbfuncs="$EDITOR ~/.dbfuncs.sh"
alias uall="(cd ~ && git add .gitignore .aliases.sh .common.sh .env.sh .bash_profile .bashrc .vimrc -f && git commit -m 'Config updates' && gp && git push origin master && sourceme)"

## node
export PATH=$PATH:$HOME/bin:/usr/local/bin/npm
export PATH=/home/$USER/node/:$PATH
alias npmo="(cd ~/.local-npm && local-npm &)"
alias npm-local="npm set registry http://127.0.0.1:5080"
alias npm-std="npm set registry https://registry.npmjs.org"

# profile
alias bashconfig="$EDITOR ~/.bash_profile"
if [ -n "${BASH_VERSION}" ]; then
    alias sourceme="source ~/.bash_profile"
fi

#install rmate
alias getrmate="curl -Lo ~/rmate https://raw.github.com/textmate/rmate/master/bin/rmate && sudo chmod a+x ~/rmate"
# to connect, ssh -R 52698:localhost:52698 user@yourServer. or, .ssh/config specify this

# unix generic
alias network="sudo $EDITOR /etc/network/interfaces"
alias startup="sudo $EDITOR /etc/rc.local"
alias powerdown="sudo shutdown -hP -t 1 now"

# browser
alias jslog="echo 'log = function() { a=arguments; i=0; while(a[i]) { console.log(a[i]);++i; } }'"

# Get weird
echo "CHA-CHING! ${NICKNAME:=$USER} is runnin' $OS $VER $BITS-bit ($ARCTCTR)"

alias mininet="ssh -R 52698:localhost:52698 -X mininet@192.168.56.10"

movToGif() {
  `ffmpeg -i $1 -pix_fmt rgb24 -r 5 -f gif - | gifsicle --optimize=5 --delay=10 > $1.gif`;
}

# dirsize
dir-size () {
  du -L -h -d 1 $1 | gsort -h;
}
