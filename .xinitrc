
setxkbmap us_qwertz
xmodmap ~/.Xmodmap
picom &
feh --bg-center ~/dotfiles/bg.png
if [ -f ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi


setxkbmap -option caps:none

dwm >> ~/.dwm.log 2>&1

# Restart dwm in a loop to avoid restarting Xorg
#while true; do
#    # Log restarts, if needed
#done
