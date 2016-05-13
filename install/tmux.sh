# install tmuxconf
# first remove old symlinks
rm -f ~/.tmux_old_nepjua 2>/dev/null
rm -f ~/.tmux.conf_old_nepjua 2>/dev/null

mv ~/.tmux ~/.tmux_old_nepjua 2>/dev/null
mv ~/.tmux.conf ~/.tmux.conf_old_nepjua 2>/dev/null
ln -s `pwd`/modules/tmux ~/.tmux 2>/dev/null
ln -s ~/.tmux/.tmux.conf ~/.tmux.conf 2>/dev/null

mkdir ~/.tmux-plugins/
ln -s `pwd`/modules/tmux-yank ~/.tmux-plugins/tmux-yank 2>/dev/null
