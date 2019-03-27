# nepjua initialization hook
#
# You can use the following variables in this file:
# * $package       package name
# * $path          package path
# * $dependencies  package dependencies
#

set fish_greeting ""
set -x NEPJUA_PATH $HOME/.config/fisher/local/$USER/fish-plugin-nepjua
set -x EDITOR vim

source $HOME/.asdf/asdf.fish

source $NEPJUA_PATH/aliases/docker.fish

alias lsl "command ls --color"
alias ls lsd

abbr -a cls clear

set -x IS_WSL (grep Microsoft /proc/sys/kernel/osrelease 2>/dev/null \
  | wc -l | sed -e 's/^[ \t]*//' -e 's/[ \t]*$//')

set -x NODEJS_CHECK_SIGNATURES no

set -x PATH (yarn global bin) $PATH
set -x PATH $NEPJUA_PATH/../bin $PATH
set -x TERM xterm-256color
set -x BYOBU_BACKEND tmux

set -g theme_display_user yes
set -g theme_color_scheme terminal-dark
set -g theme_display_ruby no

if test -d $HOME/.kube
  set -x KUBECONFIG (echo $HOME/.kube/config* | sed -e "s/\ /:/g")
end

if [ "$IS_WSL" != "0" ]
  # if we're in WSL
  source $NEPJUA_PATH/wsl.init.fish
else
  # we're in a non-wsl unix environment
  source $NEPJUA_PATH/unix.init.fish
end

if type -q code
  set -x EDITOR "code --wait"
else if type -q subl
  set -x EDITOR "subl --wait"
end

# if type -q microk8s.docker
#   set -x DOCKER_HOST "unix:///var/snap/microk8s/current/docker.sock"
# end