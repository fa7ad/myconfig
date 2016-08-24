#!/bin/bash
scrot /tmp/screen.png
convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
convert /tmp/screen.png ~/.config/i3/lock.png -gravity center -composite -matte /tmp/screen.png

i3lock -i /tmp/screen.png
rm /tmp/screen.png

# Wanted trigger timeout in milliseconds.
IDLE_TIME=$((1*30*1000))

# Sequence to execute when timeout triggers.
trigger_cmd() {
    pgrep i3lock && xset dpms force off
}

sleep_time=$IDLE_TIME
triggered=false

# ceil() instead of floor()
while sleep $(((sleep_time+999)/1000)); do
    idle=$(xprintidle)
    if [ $idle -ge $IDLE_TIME ]; then
        if ! $triggered; then
            trigger_cmd
            triggered=true
            sleep_time=$IDLE_TIME
        fi
    else
        triggered=false
        # Give 100 ms buffer to avoid frantic loops shortly before triggers.
        sleep_time=$((IDLE_TIME-idle+100))
    fi
done
