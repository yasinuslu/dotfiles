# nepjua initialization hook
#
# You can use the following variables in this file:
# * $package       package name
# * $path          package path
# * $dependencies  package dependencies
#

set fish_greeting ""
set -x NEPJUA_PATH $HOME/.config/fisherman/nepjua
set -x EDITOR vim

source $NEPJUA_PATH/aliases/git.fish
source $NEPJUA_PATH/aliases/nepjua.fish
source $NEPJUA_PATH/aliases/docker.fish

set -x LS_COLORS "rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=01;36;40:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:"

set -x IS_WSL (grep Microsoft /proc/sys/kernel/osrelease 2>/dev/null \
  | wc -l | sed -e 's/^[ \t]*//' -e 's/[ \t]*$//')

set -x PATH $HOME/.config/fnm/bin $PATH
set -x PATH $HOME/.yarn/bin $PATH
set -x PATH $NEPJUA_PATH/../bin $PATH
set -x TERM xterm-256color

set -g theme_display_user yes

if [ "$IS_WSL" != "0" ]
  set fish_greeting ""
  set -x DOCKER_HOST tcp://localhost:2375
  alias subl='"/c/Program Files/Sublime Text 3/subl.exe"'
  export BROWSER='/c/Program Files (x86)/Google/Chrome/Application/chrome.exe'
  cd
  umask 022
  if [ (df -h | grep ' /c$' | wc -l) = "0" ]
    mkdir -p /c
    sudo mount --bind /mnt/c /c
  end
  if [ (df -h | grep ' /d$' | wc -l) = "0" ]
    mkdir -p /d
    sudo mount --bind /mnt/d /d
  end
else
  switch (uname)
    case Linux
      if test -d $HOME/.gvm
        bass source $HOME/.gvm/scripts/gvm
      end
      
      if test -d $HOME/Android/Sdk
        set -x ANDROID_HOME $HOME/Android/Sdk
        set -x PATH $ANDROID_HOME/tools $PATH
        set -x PATH $ANDROID_HOME/platform-tools $PATH
      end

      set -x PATH $HOME/.local/bin $PATH
      set -x PATH /snap/bin $PATH
      set -x LIBVIRT_DEFAULT_URI "qemu:///system"
    case Darwin
      if test -d $HOME/Library/Android/sdk
        set -x ANDROID_HOME $HOME/Library/Android/sdk
        set -x PATH $PATH $ANDROID_HOME/tools
        set -x PATH $PATH $ANDROID_HOME/platform-tools
      end
    case FreeBSD NetBSD DragonFly
    case '*'
  end

  if not type -q subl
    if type -q subl3
      alias subl="subl3"
    end
  end
end
