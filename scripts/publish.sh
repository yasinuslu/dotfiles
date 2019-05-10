#!/usr/bin/env bash

build() {
  docker build -t yasinuslu/dotfiles .
}

push() {
  docker push yasinuslu/dotfiles
}

build
push
