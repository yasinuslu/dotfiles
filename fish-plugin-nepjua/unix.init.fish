if test -d $HOME/go
  set -x GOPATH $HOME/go
  set -x PATH $GOPATH/bin $PATH
end

switch (uname)
  case Linux
    source $NEPJUA_PATH/linux.init.fish
  case Darwin
    source $NEPJUA_PATH/mac.init.fish
  case FreeBSD NetBSD DragonFly
  case '*'
end

if not type -q subl
  if type -q subl3
    alias subl="subl3"
  end
end