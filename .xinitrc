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
i3
