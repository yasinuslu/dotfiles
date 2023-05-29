function __nepjua_common_init
  set -xg EDITOR vim

  __nepjua_docker_alias_init

  alias lsl "command ls --color"
  alias ls lsd
  alias cat bat
  alias pcat "bat --plain"

  abbr -a gcd "cd (git rev-parse --show-toplevel)"
  abbr -a gcom "git checkout (git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')"

  abbr -a cls clear

  set -xg IS_WSL (grep Microsoft /proc/sys/kernel/osrelease 2>/dev/null \
    | wc -l | sed -e 's/^[ \t]*//' -e 's/[ \t]*$//')

  set -xg NODEJS_CHECK_SIGNATURES no

  fish_add_path $HOME/.fzf/bin
  fish_add_path $HOME/.local/bin

  set -xg TERM xterm-256color
  set -xg BYOBU_BACKEND tmux

  set -xg theme_display_user yes
  set -xg theme_color_scheme terminal-dark
  set -xg theme_display_ruby no

  if test -d $HOME/.kube
    set -xg KUBECONFIG (echo $HOME/.kube/config* | sed -e "s/\ /:/g")
  end

  if type -q podman
    alias docker podman
    alias docker-compose podman-compose
  end

  if [ "$IS_WSL" = "0" ]
    # we're in a non-wsl unix environment
    __nepjua_unix_init
  else
    # if we're in WSL
    __nepjua_wsl_init
  end


  if type -q code-insiders
    set -xg EDITOR "code-insiders --wait"
  else if type -q code
    set -xg EDITOR "code --wait"
  else if type -q subl
    set -xg EDITOR "subl --wait"
  end

  if type -q gpg
    set -xg GPG_TTY (tty)
  end

  if type -q yay
    alias yay "yay --color=always --noconfirm"
  end

  if test -d $HOME/.cargo/bin
    fish_add_path $HOME/.cargo/bin
  end

  if test -d $HOME/.cabal/bin
    fish_add_path $HOME/.cabal/bin
  end

  if test -d $HOME/.ghcup/bin
    fish_add_path $HOME/.ghcup/bin
  end

  if test -d $HOME/.nix-profile/
    bass source $HOME/.nix-profile/etc/profile.d/*.sh
  end

  if test -d $HOME/.config/op/plugins.sh
    source $HOME/.config/op/plugins.sh
  end

  if type -q npm
    fish_add_path (npm -g bin)
  end

  if type -q yarn
    fish_add_path (yarn global bin)
  end

  if type -q java
    set -xg JAVA_HOME (asdf where java)
  end

  if type -q flutter
    set -xg FLUTTER_ROOT (asdf where flutter)
  end

  if type -q starship
    starship init fish | source
  end

  if type -q react-native
    abbr --add rn 'react-native'
  end

  if test -d $PWD/vendor/bin
    fish_add_path $PWD/vendor/bin
  end

  # TODO: install fd with dotfiles and remove if check
  if type -q fd
    # use https://github.com/sharkdp/fd for fzf if available, respects .gitignore
    set -xg FZF_DEFAULT_COMMAND 'fd --type f'
    # To apply the command to CTRL-T as well
    set -xg FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
  end

  set -gx PNPM_HOME "$HOME/.local/share/pnpm"
  set -gx PATH "$PNPM_HOME" $PATH

end
