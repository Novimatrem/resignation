#!/bin/bash
cd "$(dirname "$0")"

cd ./my-deps

bash limit-pulseaudio-max-volume-to-1-percent.sh &
bash warning-sound-if-volume-is-1-percent.sh &


