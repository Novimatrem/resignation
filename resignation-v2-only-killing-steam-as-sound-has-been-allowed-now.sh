#!/bin/bash
# resignation-v2-only-killing-steam-as-sound-has-been-allowed-now.sh

while true
do

cd "$(dirname "$0")"

echo "sleep 1s to reduce cpu usage"
sleep 1s
killall steam
pkill steam

done

# eof


