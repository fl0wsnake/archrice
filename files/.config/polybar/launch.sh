#!/bin/bash
#!/usr/bin/env sh

killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 1; done
for i in $(polybar -m | awk -F: '{print $1}'); do MONITOR=$i polybar example -c ~/.config/polybar/config >> ~/pol.txt & done

echo "Bars launched..."
