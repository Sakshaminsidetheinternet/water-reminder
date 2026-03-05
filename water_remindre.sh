#!/bin/bash

interval=${1:-30}

while true; do
notify-send \
 -u normal \
 -t 5000 \
  "💧 Hydration Reminder" \
 "Drink water and stay focused!" 
sleep "$((interval * 60))"
done
     
