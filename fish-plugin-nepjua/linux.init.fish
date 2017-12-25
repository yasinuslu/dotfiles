source $NEPJUA_PATH/aliases/linux.fish

alias o="xdg-open"

if not type -q subl
  if type -q subl3
    alias subl="subl3"
  end
end

set ANDROID_HOME $HOME/Android/Sdk
set PATH $PATH $ANDROID_HOME/tools
set PATH $PATH $ANDROID_HOME/platform-tools