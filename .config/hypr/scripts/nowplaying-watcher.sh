#!/bin/bash
players=$(playerctl -l 2>/dev/null)
cached_image_path=~/.cache/nowplaying.png
last_img_url_file=~/.cache/last_played_img_url.txt
default_image_path=~/.config/hypr/scripts/pictures/default_media.png
empty_image_path=~/.config/hypr/scripts/pictures/empty_media.png


reload_img() {
	kill -SIGUSR2 $(pidof hyprlock) 2>/dev/null #SIGUSR2 signal reloads the image in hyprlock
}

download_img() {
	local url="$1"	
	if [[ "$url" == file://* ]]; then
		cp "${url#file://}" "$cached_image_path"
	elif wget -q -O "$cached_image_path" "$url"; then
		break
	else
		cp "$default_image_path" "$cached_image_path"
	fi
}

process_img() {
	local image_url=$(echo $1 | awk -F '|' '{print $2}' | xargs)
	local last_img_url=$(cat "$last_img_url_file" 2>/dev/null)
	if [[ "$image_url" != "$last_img_url" ]]; then
		download_img "$image_url"
		magick "$cached_image_path" -gravity center -crop 1:1 +repage -modulate 70,100,100 "$cached_image_path"
		reload_img
		echo $image_url > $last_img_url_file
	fi
}

if [[ -z "$players" ]]; then
	cp "$empty_image_path" "$cached_image_path"
	echo "nothing playing" > "$last_img_url_file"
	reload_img
fi

for player in $players; do
	if [[ $(playerctl -p $player status 2>/dev/null) == "Playing" ]]; then
		meta=$(playerctl -p $player metadata --format "{{playerName}}|{{mpris:artUrl}}|{{artist}}|{{album}}|{{title}}")
		process_img "$meta"
		meta=$(echo "${meta//&/&amp;}") # Escape &
		echo $meta | awk -F '|' -v OFS='\n' '{$1 = toupper(substr($1,1,1)) substr($1,2);print $1,$3,$4,$5}'
		break
	fi
done

if [[ -z "$meta" ]]; then
	cp "$empty_image_path" "$cached_image_path"
	echo "nothing playing" > "$last_img_url_file"
	reload_img
fi
