#!/bin/sh
channels="$(pacmd list-sinks | grep -P -o '(?<=index:\s)\d')"
for i in $channels; do
        pactl set-sink-mute "$i" toggle
done
