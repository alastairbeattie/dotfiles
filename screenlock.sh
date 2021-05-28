#!/bin/bash
echo hi
scrot -e 'mv $f /tmp/screen.png && convert /tmp/screen.png -filter Gaussian -blur 0x15 /tmp/screen.png'
