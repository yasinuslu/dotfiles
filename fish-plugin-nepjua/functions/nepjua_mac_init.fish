function nepjua_mac_init
  if test -d $HOME/Library/Android/sdk
    set -xg ANDROID_HOME $HOME/Library/Android/sdk
    set -xg PATH $PATH $ANDROID_HOME/tools
    set -xg PATH $PATH $ANDROID_HOME/platform-tools
  end

  if test -d /opt/homebrew
    set -xg PATH $PATH /opt/homebrew/bin/
  end
end