function nepjua_common_init
  function fish_greeting 
  end

  set -x EDITOR vim

  source $HOME/.asdf/asdf.fish

  nepjua_docker_alias_init

  alias lsl "command ls --color"
  alias ls lsd
  alias cat bat

  abbr -a cls clear

  set -x IS_WSL (grep Microsoft /proc/sys/kernel/osrelease 2>/dev/null \
    | wc -l | sed -e 's/^[ \t]*//' -e 's/[ \t]*$//')

  set -x NODEJS_CHECK_SIGNATURES no

  set -x PATH $HOME/.fzf/bin $PATH
  set -x PATH $HOME/.local/bin $PATH

  set -x TERM xterm-256color
  set -x BYOBU_BACKEND tmux

  set -g theme_display_user yes
  set -g theme_color_scheme terminal-dark
  set -g theme_display_ruby no

  if test -d $HOME/.kube
    set -x KUBECONFIG (echo $HOME/.kube/config* | sed -e "s/\ /:/g")
  end

  if [ "$IS_WSL" != "0" ]
    # if we're in WSL
    nepjua_wsl_init
  else
    # we're in a non-wsl unix environment
    nepjua_unix_init
  end


  if type -q code-insiders
    set -x EDITOR "code-insiders --wait"
  else if type -q code
    set -x EDITOR "code --wait"
  else if type -q subl
    set -x EDITOR "subl --wait"
  end

  if test -d $HOME/.cabal/bin
    set -x PATH $HOME/.cabal/bin $PATH
  end

  if test -d $HOME/.ghcup/bin
    set -x PATH $HOME/.ghcup/bin $PATH
  end

  if test -d $HOME/.nix-profile/
    bass source $HOME/.nix-profile/etc/profile.d/nix.sh
  end

  if type -q yarn
    set -x PATH (yarn global bin) $PATH
  end

  if type -q java
    set -x JAVA_HOME (asdf where java)
  end

  if type -q flutter
    set -x FLUTTER_ROOT (asdf where flutter)
  end

  if type -q starship
    starship init fish | source
  end

  if type -q react-native
    abbr --add rn 'react-native'
  end

  if type -q gpg
    set -x GPG_TTY (tty)
  end

  # TODO: install fd with dotfiles and remove if check
  if type -q fd
    # use https://github.com/sharkdp/fd for fzf if available, respects .gitignore
    set -x FZF_DEFAULT_COMMAND 'fd --type f'
    # To apply the command to CTRL-T as well
    set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
  end

end