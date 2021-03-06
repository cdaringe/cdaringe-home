#!/bin/bash

for i in $(ls .env)
do
  . .env/$i
done

export ARCTCTR=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')
export NODE_ENV='development'

if [ -f /etc/lsb-release ]; then
  . /etc/lsb-release
  OS=$DISTRIB_ID
  VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
  OS="ubuntu"  # XXX or Ubuntu??
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

# add JAVA_HOME for OSX
if [ -f /usr/libexec/java_home ]; then
  export JAVA_HOME=$(/usr/libexec/java_home)
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
