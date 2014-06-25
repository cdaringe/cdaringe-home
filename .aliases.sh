# Get system data
ARCH=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')

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
else
    OS=$(uname -s)
    VER=$(uname -r)
fi

case $(uname -m) in
x86_64)
    BITS=64
    ;;
i*86)
    BITS=32
    ;;
*)
    BITS=?
    ;;
esac

# config
export EDITOR='vim' #default
alias dbmap="$EDITOR /var/lib/coins_auth/conn/dbmap.json"
alias dbf="cd /var/lib/coins_auth/conn"

## file
alias gcb='git checkout -b'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias purgedir="rm -rf .* *"
alias purgeswap="rm -rf ~/.vim/swapfiles"
alias home="cd ~"
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

## remote
alias mount10="sshfs cdieringer@neweb10: /Users/cdieringer/Documents/remote"
alias ssh10="ssh neweb10 -t screen"
alias list="screen -list"
alias web="cd /var/www/html"
alias scpTo10="scp $1 cdieringer@neweb10:~/"
alias scpTo10f="scp -r $1 cdieringer@neweb10:~/"
alias scpFrom10="scp cdieringer@neweb10:~/$1 ~/Desktop/"
alias scpFrom10f="scp -r cdieringer@neweb10:~/$1 ~/Desktop/"
alias rmateclog="echo 'Kill process using 52698 (kill ###)'; sudo netstat -antpl  | grep 52698"

# git
alias gs="git status"
alias gpm="git pull origin master"
alias gpd="git pull origin develop"
alias gpushm="git push origin develop"
alias gpushd="git push origin develop"
alias gpush="git push origin $1"
alias gp="git pull"
alias gcm="git commit -am $1"
alias gbl="git branch --list"
alias gba="git branch --list -a"
function gcr() {
  echo "git checkout -b $1 origin/$1";
  echo `git checkout -b $1 origin/$1`;
}

## compression
alias untar="tar -xvf $1"

#** SERVER **#
    if [[ $OS == 'centos' ]]; then
        ## apache
        alias serverconf="sudo $EDITOR /etc/httpd/conf/httpd.conf"
        alias sslconf="sudo $EDITOR /etc/httpd/conf.d/ssl.conf"
        
        alias serverrestart="sudo /sbin/service httpd restart"
        alias serverstop="sudo /sbin/service httpd stop"
        alias serverstart="sudo /sbin/service httpd start"

        #php
        alias phpini="sudo $EDITOR /etc/php.ini"

    elif [[ $OS == 'Darwin' ]]; then
        ## osx only
        alias showhidden="defaults write com.apple.finder AppleShowAllFiles -boolean true ; killall Finder"
        alias hidehidden="defaults write com.apple.finder AppleShowAllFiles -boolean false ; killall Finder"
        alias dsoff="defaults write com.apple.desktopservices DSDontWriteNetworkStores true"
        alias dson="defaults write com.apple.desktopservices DSDontWriteNetworkStores false"
        
        #set sublime to default editor. gen symlink for executing via cmd line
        if [ "$EDITOR" != 'sublime' ]; then export EDITOR='sublime'; fi;
        if [[ ! -f //usr/local/bin/sublime ]]; then
          echo `ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/sublime`
        fi
        export PATH=/home/$USER/node/selenium_drvers_osx/:$PATH
    elif [[ $OS == 'ubuntu' ]]; then
        alias serverconf="sudo $EDITOR /etc/apache2/sites-enabled/000-default"
        alias siteconf="sudo $EDITOR /etc/apache2/envvars"
    
        alias serverrestart="sudo /etc/init.d/apache2 restart"
        alias serverstop="sudo /etc/init.d/apache2 stop"
        alias serverstart="sudo /etc/init.d/apache2 start"

        #php
        alias phpini="sudo $EDITOR /etc/php5/apache2/php.ini"
    fi

# vim
alias vimrc="vim ~/.vimrc"
alias covimsrv="python ~/.vim/bundle/CoVim/plugin/CoVimServer.py"

alias aliases="$EDITOR ~/.aliases.sh"
alias ualiases="(cd ~;git add ~/.aliases.sh; git commit -m 'aliases updated';git push origin master;sourceme)"

    ## node
    export PATH=$PATH:$HOME/bin:/usr/local/bin/npm
    export PATH=/home/$USER/node/:$PATH
    alias unlock="sudo rm /var/run/node.lock /var/run/forever.lock"
    alias killtasker="sudo kill $(ps aux | grep '[n]ode ' | awk '{print $2}')"
    
    ## httpster
    alias httpup="httpster /Users/cdieringer/ &"
    alias httpdown="kill $(ps aux | grep '[h]ttpster' | awk '{print $2}')"

## git
clonehere () {
    git init | git remote add origin $1 | git pull origin
}

## screen
# kill detached
killd () {
    screen -ls | grep Detached | cut -d. -f1 | awk '{print $1}' | xargs kill
}
# kill all
killa () {
    screen -ls | grep Detached | cut -d. -f1 | awk '{print $1}' | xargs kill
    screen -ls | grep tached | cut -d. -f1 | awk '{print $1}' | xargs kill
}

if [ -n "${ZSH_VERSION}" ]; then 
    alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
    alias sourceme="source ~/.zshrc" 
    alias zshconfig="$EDITOR ~/.zshrc"
elif [ -n "${BASH_VERSION}" ]; then
    alias sourceme="source ~/.bash_profile"
    alias bashconfig="$EDITOR ~/.bash_profile"
fi

# Get weird
echo "CHA-CHING! Ceez is runnin' $OS $VER $BITS -bit"
alias ceez='echo ceez on my knees, baby please'
