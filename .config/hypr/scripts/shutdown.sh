#!/bin/bash
read -rp "You sure you want to exit the cave? (Y/N) " confirmation
case "$confirmation" in
	[yY]|[yY][eE][sS])
		echo "Shutdown confirmed" && shutdown now
		;;
	[hH])
		echo "Hibernate! Progress will be saved" && systemctl hibernate
		;;
	[rR])
		echo "Rebooting" && reboot
		;;
	[sS]) 	echo "Suspending" && systemctl suspend
		;;
	*)
		echo "Shutdown declined"
		;;
esac
