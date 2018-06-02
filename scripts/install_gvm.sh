#!/bin/bash

function installGvm() {
  bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
  
  source $HOME/.gvm/scripts/gvm
  gvm install go1.10.2 -B
  gvm use go1.10.2 --default
  mkdir -p $HOME/.gvm/pkgsets/go1.10.2/global/bin
  curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
}

installGvm