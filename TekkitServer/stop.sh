#!/bin/bash
screen -S TekkitServer -X stuff "save-all"
sleep 5
screen -S TekkitServer -X stuff "stop"
