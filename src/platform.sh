# WARNING: I was unable to ignore shell script formatting for this file, it gets broken when formatted
# Please make sure you did not change this file by accident

DF_PLATFORM=""

df_get_platform() {
  local machine
  local unameOut

  # if we're on wsl, set DF_PLATFORM to WSL, else figure out which platform we're on
  # disable shellcheck formatting
  # shellcheck disable=SC2059
  if grep -qEi "(Microsoft|WSL)" /proc/version &> /dev/null; then
    DF_PLATFORM="WSL"
    return
  else
    unameOut="$(uname -s)"
    case "${unameOut}" in
      Linux*) machine=Linux ;;
      Darwin*) machine=Mac ;;
      CYGWIN*) machine=Cygwin ;;
      MINGW*) machine=MinGw ;;
      *) machine="UNKNOWN:${unameOut}" ;;
    esac

    DF_PLATFORM="${machine}"
  fi
}
