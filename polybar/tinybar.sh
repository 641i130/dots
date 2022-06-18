#!/bin/bash
u=$(xprop -name "Polybar tray window" _NET_WM_PID | awk -F "= " '{print $2}')
if [ $u -Z ] 
then polybar tray &
sleep 10
u=$(xprop -name "Polybar tray window" _NET_WM_PID | awk -F "= " '{print $2}')
else kill $u
fi
