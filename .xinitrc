#!/bin/sh

case $HOST in
    asuka)
        picom &
        ;;
    wks )
        ./mouse.py &
        ~/screen_up.sh &
        ;;
    * )
        echo unknown host
    ;;
esac

feh --bg-fill .config/background.jpg &
#feh --bg-fill .config/background.jpg
#feh --no-xinerama --bg-fill Downloads/jpg/milky-way-triple-monitor-wallpaper.jpg
<<<<<<< HEAD
feh --bg-fill .config/background.jpg
=======
xset s 120 120
#xss-lock -n ~/screenlock.sh -- i3lock -i /tmp/screen.png&
xss-lock -- i3lock --blur=10&
numlockx
>>>>>>> fdd12d7a3bbbc62fe418c06e174ed642188e2e71
i3
