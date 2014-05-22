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

echo "CHA-CHING! Ceez is runnin' $OS $VER $BITS -bit" 

# config
alias vimrc="vim ~/.vimrc"
alias aliases="vim ~/.bash_aliases"
alias sourceme="source ~/.bash_profile"

## file
alias purgedir="rm -rf .* *"
alias purgeswap="rm -rf ~/.vim/swapfiles"
alias home="cd ~"

## remote
alias mount10="sshfs cdieringer@neweb10: /Users/cdieringer/Documents/remote"
alias ssh10="ssh neweb10 -t screen; source ~/.bash_profile"
alias list="screen -list"
alias web="cd /var/www/html"
alias scpTo10="scp $1 cdieringer@neweb10:~/"
alias scpTo10f="scp -r $1 cdieringer@neweb10:~/"
alias scpFrom10="scp cdieringer@neweb10:~/$1 ~/Desktop/"
alias scpFrom10f="scp -r cdieringer@neweb10:~/$1 ~/Desktop/"

# git
alias gpm="git pull origin master"
alias gpushm="git push origin master"
alias gpush="git push origin $1"
alias gp="git pull origin $1"
alias gcm="git commit -a -m $1"
alias gbl="git branch --list"

## compression
alias untar="tar -xvf $1"

#** SERVER **#
    if [[ $OS == 'centos' ]]; then
        ## apache
        alias serverconf="sudo vim /etc/httpd/conf/httpd.conf"
        alias sslconf="sudo vim /etc/httpd/conf.d/ssl.conf"
        
        alias serverrestart="sudo /sbin/service httpd restart"
        alias serverstop="sudo /sbin/service httpd stop"
        alias serverstart="sudo /sbin/service httpd start"

        #php
        alias phpini="sudo vim /etc/php.ini"

    elif [[ $OS == 'ubuntu' ]]; then
        alias serverconf="sudo vim /etc/apache2/sites-enabled/000-default"
        alias siteconf="sudo vim /etc/apache2/envvars"
    
        alias serverrestart="sudo /etc/init.d/apache2 restart"
        alias serverstop="sudo /etc/init.d/apache2 stop"
        alias serverstart="sudo /etc/init.d/apache2 start"

        #php
        alias phpini="sudo vim /etc/php5/apache2/php.ini"
    fi

    ## node
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

## osx only
alias showhidden="defaults write com.apple.finder AppleShowAllFiles -boolean true ; killall Finder"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles -boolean false ; killall Finder"
alias dsoff="defaults write com.apple.desktopservices DSDontWriteNetworkStores true"
alias dson="defaults write com.apple.desktopservices DSDontWriteNetworkStores false"

