if test -d $HOME/Library/Android/sdk
  set -x ANDROID_HOME $HOME/Library/Android/sdk
  set -x PATH $PATH $ANDROID_HOME/tools
  set -x PATH $PATH $ANDROID_HOME/platform-tools
end