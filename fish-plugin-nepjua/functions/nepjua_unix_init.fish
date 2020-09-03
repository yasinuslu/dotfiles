function nepjua_unix_init
  if test -d $HOME/go
    set -xg GOPATH $HOME/go
    set -xg PATH $GOPATH/bin $PATH
  end

  switch (uname)
    case Linux
      nepjua_linux_init
    case Darwin
      nepjua_mac_init
    case FreeBSD NetBSD DragonFly
    case '*'
  end

  if not type -q subl
    if type -q subl3
      alias subl="subl3"
    end
  end
end