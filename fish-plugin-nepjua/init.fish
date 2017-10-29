# nepjua initialization hook
#
# You can use the following variables in this file:
# * $package       package name
# * $path          package path
# * $dependencies  package dependencies
# 

set -x NEPJUA_PATH $HOME/.config/fisherman/nepjua

source $NEPJUA_PATH/aliases/git.fish
source $NEPJUA_PATH/aliases/nepjua.fish

switch (uname)
  case Linux
    source $NEPJUA_PATH/linux.init.fish
  case Darwin
    source $NEPJUA_PATH/mac.init.fish
  case FreeBSD NetBSD DragonFly
  case '*'
end
