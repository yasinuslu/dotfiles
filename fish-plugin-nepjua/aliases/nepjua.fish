alias cls=clear

if [ (which yaourt) = "/usr/bin/yaourt" ]
  alias ync='yaourt --noconfirm'
  alias ynci='yaourt --noconfirm -S'
end