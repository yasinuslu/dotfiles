# Installation
```
git clone https://github.com/yasinuslu/dotfiles
cd dotfiles
./install.sh
```

# Notes
- If you get errors like `mv: cannot stat ‘/home/nepjua/.nvm’: No such file or directory` ignore them. Install script backups old folders if they exist and logs error if they don't. I'll pipe those to /dev/null later.
- You may need to install stable node.js with `nvm install stable`

#Includes
- https://github.com/zsh-users/antigen
- https://github.com/robbyrussell/oh-my-zsh
- https://github.com/tony/tmux-config
- https://github.com/amix/vimrc

Uses `agnoster` theme
