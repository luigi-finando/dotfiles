#!/bin/sh
# probably only works on my computer :P

dwmdir="$HOME/SoftwareSources/dwm-6.1"
mpddir="$HOME/.config/mpd"
ncmpcppdir="$HOME/.config/ncmpcpp"

ln -s $HOME/dotfiles/vimrc ~/.vimrc
ln -s $HOME/dotfiles/dwm-config.h $dwmdir/config.h
ln -s $HOME/dotfiles/mpd.conf $mpddir/mpd.conf
ln -s $HOME/dotfiles/ncmpcpp.conf $ncmpcppdir/config
