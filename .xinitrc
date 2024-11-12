
setxkbmap us_qwertz
xmodmap ~/.Xmodmap
picom &
feh --bg-center ~/dotfiles/bg.png

# Restart dwm in a loop to avoid restarting Xorg
while true; do
    # Log restarts, if needed
    dwm >> ~/.dwm.log 2>&1
done
