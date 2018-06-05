#!/bin/sh
# probably only works on my computer :P

dwmdir="$HOME/SoftwareSources/dwm-6.1"
mpddir="$HOME/.config/mpd"
ncmpcppdir="$HOME/.config/ncmpcpp"
i3dir="$HOME/.config/i3"
comptondir="$HOME/.config/compton"
ohmyzshdir="$HOME/.oh-my-zsh/custom"


ln -s $HOME/dotfiles/fino-luis.zsh-theme $ohmyzshdir/fino-luis.zsh-theme
ln -s $HOME/dotfiles/vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/xinitrc $HOME/.xinitrc
ln -s $HOME/dotfiles/dwm-config.h $dwmdir/config.h
ln -s $HOME/dotfiles/mpd.conf $mpddir/mpd.conf
ln -s $HOME/dotfiles/ncmpcpp.conf $ncmpcppdir/config
ln -s $HOME/dotfiles/i3-config $i3dir/config
ln -s $HOME/dotfiles/compton.conf $comptondir/compton.conf
ln -s $HOME/dotfiles/tmux.conf $HOME/.tmux.conf
