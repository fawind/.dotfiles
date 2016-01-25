channels="$(pacmd list-sinks | grep -P -o '(?<=index:\s)\d')"
for i in $channels; do
        pactl set-sink-volume "$i" +5%
done
