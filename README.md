# Dotfiles

![](assets/screenshot.png)

### Backup all your current dotfiles, this dotfiles will delete them without any warnings.

## Demo

You can check out this dotfiles with docker:

```sh
docker run --rm -it yasinuslu/dotfiles
```

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

## References

- [https://github.com/gpakosz/.tmux](https://github.com/gpakosz/.tmux)
- [https://github.com/junegunn/fzf](https://github.com/junegunn/fzf)
- [https://github.com/SpaceVim/SpaceVim](https://github.com/SpaceVim/SpaceVim)
- [https://github.com/icy/pacapt](https://github.com/icy/pacapt)
- [https://github.com/asdf-vm/asdf](https://github.com/asdf-vm/asdf)
