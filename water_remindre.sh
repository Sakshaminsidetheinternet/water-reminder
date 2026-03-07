
#!/bin/bash

interval=${1:-30}
goal=${2:-8}
startup_delay=${3:-180}

logdir="$HOME/.water_logs"
mkdir -p "$logdir"

today=$(date +%F)
logfile="$logdir/$today.log"

sound="/usr/share/sounds/freedesktop/stereo/complete.oga"

echo "Hydration reminder started"
echo "Interval: $interval minutes"
echo "Daily goal: $goal glasses"
echo "Startup delay: $startup_delay seconds"

sleep "$startup_delay"

while true; do
    ((count++))

    echo "$(date '+%H:%M:%S') Glass $count" >> "$logfile"

    notify-send \
        -u normal \
        -t 5000 \
        "💧 Hydration Reminder" \
        "Glass $count / $goal - Drink water!"

    paplay "$sound"

    sleep "$((interval * 60))"
done
