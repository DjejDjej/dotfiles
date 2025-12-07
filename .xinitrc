xmodmap ~/.Xmodmap
picom &
feh --bg-fill ~/dotfiles/bg.png
if [ -f ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi
warpd
xinput --set-prop 11 "libinput Accel Speed" -0.7
setxkbmap -option caps:none

dwm >> ~/.dwm.log 2>&1
xinput --set-prop 13 "libinput Accel Speed" -0.8
