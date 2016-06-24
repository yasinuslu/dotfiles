alias cls='clear'
alias ync='yaourt --noconfirm'
alias ynci='yaourt -S --noconfirm'

export PATH="$PATH:$HOME/.meteor/"
export PATH="$PATH:$HOME/Android/Sdk/platform-tools/"
export PATH="$PATH:$HOME/.config/composer/vendor/bin/";

alias o='xdg-open';
alias startvpn='systemctl start openvpn@nepjua-arch';
alias stopvpn='systemctl stop openvpn@nepjua-arch';
alias kmup='$HOME/code/github/meteor-up/index.js';

export ANDROID_HOME="$HOME/Android/Sdk";
export REACT_EDITOR=atom;
export JAVA_HOME="/usr/lib/jvm/default";

alias fixed-steam="env LD_PRELOAD='/usr/$LIB/libstdc++.so.6 /usr/$LIB/libgcc_s.so.1 /usr/$LIB/libxcb.so.1 /usr/$LIB/libgpg-error.so' steam"
