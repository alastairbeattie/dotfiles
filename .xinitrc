#!/bin/sh

#picom &
./mouse.py &
~/screen_up.sh &
#feh --bg-fill .config/background.jpg
#feh --no-xinerama --bg-fill Downloads/jpg/milky-way-triple-monitor-wallpaper.jpg
feh --bg-fill Desktop/background.jpg
xset s 120 120
#xss-lock -n ~/screenlock.sh -- i3lock -i /tmp/screen.png&
xss-lock -- i3lock --blur=10&
numlockx
i3
