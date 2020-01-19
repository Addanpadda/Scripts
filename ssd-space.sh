#!/bin/bash
echo "$(echo "scale=1;" "$(df /dev/mapper/ssd--volgroup0-lv--root | awk 'NR == 2 {print $4}')/1000000" | bc)gb"
