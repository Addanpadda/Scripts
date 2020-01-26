#!/bin/bash
ip="$(curl -Ss ifconfig.me)"
data="$(curl -Ss http://ip-api.com/line/$ip)"

echo "	ROUTING THROUGH TOR"
echo "----------------------------------------"
echo "  ip_addr:  $ip"
echo "  location: $(echo "$data" | awk 'NR == 2'), $(echo "$data" | awk 'NR == 5')"
echo -e "----------------------------------------\n"
