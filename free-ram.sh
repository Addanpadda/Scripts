#!/bin/bash
echo "$(free -m | awk 'NR == 2 {print $4}' | xargs -I{} echo "scale=1; {}/1000" | bc)gb"
