#!/bin/bash

interval=${1:-30}
goal=${2:-8}
count=0
sound="/usr/share/sounds/freedesktop/stereo/complete.oga"

echo "Hydration reminder started"
echo "Interval: $interval minutes"
echo "Daily goal: $goal glasses"

while true; do
    ((count++))

    notify-send \
        -u normal \
        -t 5000 \
        "💧 Hydration Reminder" \
        "Glass $count / $goal - Drink water and stay focused!"

    paplay "$sound"

    if [ "$count" -ge "$goal" ]; then
        notify-send "✅ Hydration Goal Completed" "You reached $goal glasses today!"
        break
    fi

    sleep "$((interval * 60))"
done

