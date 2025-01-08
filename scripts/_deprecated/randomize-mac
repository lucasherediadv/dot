#!/bin/bash
#
# Randomize your MAC address using NetworkManager

# Configuration file path
RANDOM_MAC_CONFIG_FILE="/etc/NetworkManager/conf.d/00-random-mac-addresses.conf"

# Create the configuration file or overwrite if it already exists
cat <<EOF > "$RANDOM_MAC_CONFIG_FILE"
[device]
wifi.scan-rand-mac-address=yes

[connection]
wifi.cloned-mac-address=random
ethernet.cloned-mac-address=random
connection.stable-id=${CONNECTION}/${BOOT}
EOF

# Set appropriate permissions to the file
chmod go-rwx,u+rw "$RANDOM_MAC_CONFIG_FILE"

# Restart NetworkManager
systemctl restart NetworkManager

