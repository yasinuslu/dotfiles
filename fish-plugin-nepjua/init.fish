# nepjua initialization hook
#
# You can use the following variables in this file:
# * $package       package name
# * $path          package path
# * $dependencies  package dependencies
# 

set NEPJUA_PATH $HOME/.config/fisherman/nepjua

source $NEPJUA_PATH/aliases/git.fish
source $NEPJUA_PATH/aliases/nepjua.fish

switch (uname)
  case Linux
  case Darwin
    set ANDROID_HOME $HOME/Library/Android/sdk
    set PATH $PATH $ANDROID_HOME/tools
    set PATH $PATH $ANDROID_HOME/platform-tools
  case FreeBSD NetBSD DragonFly
  case '*'
end