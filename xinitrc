#!/bin/sh

xrdb -merge ~/.Xresources
xrandr --dpi 146
nitrogen --restore
mpd&
dunst&
xinput --set-prop 9 277 1
xinput --set-prop 9 281 1
$HOME/dotfiles/dwmscripts/dwmstatus.sh &
notify-send -t 0 "$(fortune -s -o)"
compton --config $HOME/dotfiles/compton.conf -b
dropbox start&
exec $HOME/dotfiles/dwmscripts/startdwm.sh
