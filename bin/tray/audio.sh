#!/bin/sh

muted=$(pamixer --get-mute)

if [ "$muted" = true ]; then
    echo "- Mute"
else
    volume=$(pamixer --get-volume)

    if [ "$volume" -gt 49 ]; then
        echo "  $volume %"
    elif [ "$volume" -gt 15 ]; then
        echo "  $volume %"
    else
        echo "  $volume %"
    fi
fi
