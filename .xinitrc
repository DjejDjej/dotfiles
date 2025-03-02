
setxkbmap us_qwertz
xmodmap ~/.Xmodmap
picom &
feh --bg-fill ~/dotfiles/bg.png
if [ -f ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

xinput --set-prop 11 "libinput Accel Speed" -0.7
setxkbmap -option caps:none

dwm >> ~/.dwm.log 2>&1
xinput --set-prop 11 "libinput Accel Speed" -1
# Restart dwm in a loop to avoid restarting Xorg
#while true; do
#    # Log restarts, if needed
#done
