#!/bin/bash
read -rp "You sure you want to exit the cave? (Y/N) " confirmation
case "$confirmation" in
	[yY]|[yY][eE][sS])
		echo "Shutdown confirmed" && shutdown now
		;;
	*)
		echo "Shutdown declined"
		;;
esac
