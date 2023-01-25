function nepjua_linux_init
  if test -d $HOME/Android/Sdk
    set -xg ANDROID_HOME $HOME/Android/Sdk
  end

  if test -d /opt/android-sdk
    set -xg ANDROID_HOME /opt/android-sdk
  end
  
  if test -n $ANDROID_HOME
    set -xg PATH $ANDROID_HOME/tools $PATH
    set -xg PATH $ANDROID_HOME/platform-tools $PATH
  end

  if test -d /snap/bin
    set -xg PATH /snap/bin $PATH
  end

  set -xg LIBVIRT_DEFAULT_URI "qemu:///system"
  set -x VIRTUAL_ENV_DISABLE_PROMPT true
end
