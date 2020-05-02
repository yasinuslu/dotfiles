if test -d $HOME/Android/Sdk
  set -x ANDROID_HOME $HOME/Android/Sdk
end
if test -d /opt/android-sdk
  set -x ANDROID_HOME /opt/android-sdk
end
if ! test -z $ANDROID_HOME
  set -x PATH $ANDROID_HOME/tools $PATH
  set -x PATH $ANDROID_HOME/platform-tools $PATH
end

if test -d /snap/bin
  set -x PATH /snap/bin $PATH
end

set -x LIBVIRT_DEFAULT_URI "qemu:///system"