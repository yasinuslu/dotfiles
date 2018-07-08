#!/bin/bash

function installSdkman() {
  curl -s "https://get.sdkman.io" | bash
}

rm -rf ${HOME}/.sdkman
installSdkman