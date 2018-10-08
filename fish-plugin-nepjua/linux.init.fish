if test -d $HOME/Android/Sdk
  set -x ANDROID_HOME $HOME/Android/Sdk
  set -x PATH $ANDROID_HOME/tools $PATH
  set -x PATH $ANDROID_HOME/platform-tools $PATH
end

set -x PATH $HOME/.local/bin $PATH
set -x PATH /snap/bin $PATH
set -x LIBVIRT_DEFAULT_URI "qemu:///system"