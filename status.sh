battery=$(cat /sys/class/power_supply/BAT0/status)

if [ "${battery}" = "Discharging" ];
then
    battery="[$(echo "${battery}" | tr '[:lower:]' '[:upper:]')]"
else
    battery=""
fi

battery="$(cat /sys/class/power_supply/BAT0/capacity)% ${battery}"
date=$(date '+%Y-%m-%d %H:%M')
volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"
microphone="$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@)"

case $microphone in
    *'MUTED'*) microphone='󰍭' ;;
            *) microphone='' ;;
esac

echo "${volume} :: $microphone :: Battery: ${battery} :: ${date}"
