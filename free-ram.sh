#!/bin/bash
#echo "$(free -m | awk 'NR == 2 {print $4}' | xargs -I{} echo "scale=1; {}/1000" | bc)gb"
echo "$(echo "scale=1; $(free | awk 'NR == 2 {print $7}') / 1048576" | bc)gb"
