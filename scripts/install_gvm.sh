#!/bin/bash

function installGvm() {
  bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
  
  source $HOME/.gvm/scripts/gvm
  gvm install go1.10.2 -B
  gvm use go1.10.2
}

installGvm