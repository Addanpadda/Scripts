#!/bin/bash
curl -Ss wttr.in | awk 'NR == 1' | cut -d: -f2 | sed 's/ //'
