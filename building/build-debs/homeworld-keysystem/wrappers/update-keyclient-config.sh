#!/bin/bash
set -e -u

# interacts with preseed code

if grep -q TEMPORARY-KEYCLIENT-CONFIGURATION /etc/homeworld/config/keyclient.yaml
then
    if [ -e /etc/homeworld/config/local.conf ]
    then
        source /etc/homeworld/config/local.conf
        cp /etc/homeworld/config/keyclient-${KIND}.yaml /etc/homeworld/config/keyclient.yaml
        systemctl restart keyclient.service
    fi
else
    systemctl stop update-keyclient-config.timer
fi
