#!/bin/bash
while true
do 

x=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,' )
if [[ $x -le 1 ]]
then
    echo VOLUME_FINE__SKIP
fi

if [[ $x -ge 2 ]]
then
    echo TOO_LOUD_DETECTED__FIXING
    amixer -D pulse sset Master 0%
    pactl set-sink-volume @DEFAULT_SINK@ 0%
fi

echo "sleep 1s to reduce cpu usage"
sleep 1s
killall steam
pkill steam

done

# Limit PulseAudio MAX volume to 1%, to prevent hearing damage/clipping

# initial code snippet (broken) provided by unix stackexchange user Akash Kumar Singh, thanks
# code fixup and improvement by Novimatrem

