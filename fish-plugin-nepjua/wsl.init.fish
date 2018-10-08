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