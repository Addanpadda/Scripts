#!/bin/bash
df -h | grep /dev/mapper/crypt | awk 'NR==1 {print $4}' | sed 's/G/gb/'
