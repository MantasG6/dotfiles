CURRENT=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')
if (( $(echo "$CURRENT <= 0.00" | bc) )); then
    exit 1
fi
NEW=$(echo "$CURRENT - 0.05" | bc)
wpctl set-volume @DEFAULT_AUDIO_SINK@ "$NEW"
