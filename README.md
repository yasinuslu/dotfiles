# Dotfiles

### Backup all your current dotfiles, this dotfiles will delete them without any warnings.

## Installation

```sh
git clone https://github.com/yasinuslu/dotfiles.git
cd dotfiles
./install.sh
```

## Usage
We use fish, just run `fish`

### Make fish your default shell

- In POSIX compliant shells like `bash` or `zsh`
  
  ```sh
  chsh -s $(which fish)
  ```

- In `fish`
  
  ```sh
  chsh -s (which fish)
  ```

## Troubleshooting
### I cannot install global npm packages
You're probably using this dotfiles with root user. If you're getting following errors:
```
> yarn@1.13.0 postinstall /root/.asdf/installs/nodejs/10.14.1/.npm/lib/node_modules/yarn
> /root/.asdf/installs/nodejs/10.14.1/.npm/lib/node_modules/.hooks/postinstall
sh: 1: /root/.asdf/installs/nodejs/10.14.1/.npm/lib/node_modules/.hooks/postinstall: Permission denied
```

You can enable unsafe-perm flags in npm:
```sh
npm config set user 0
npm config set unsafe-perm true
```

## References:
- https://github.com/gpakosz/.tmux
- https://github.com/junegunn/fzf
- https://github.com/SpaceVim/SpaceVim
- https://github.com/icy/pacapt
- https://github.com/asdf-vm/asdf
