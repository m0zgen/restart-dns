#!/bin/bash

_NSCD="nscd"

if [[ "`systemctl is-active $_NSCD`" == "unknown" ]]; then
	#statements
	echo -e "\nService $_NSCD not installed, install from dnf...\n"
	dnf -y install $_NSCD && systemctl enable $_NSCD && systemctl start $_NSCD
fi

echo -e "\nRestarting services.."
systemctl restart NetworkManager && nscd -i hosts && systemctl restart nscd

echo -e "Complete!"
