#!/bin/bash
#                    __
#  _    _____ ___ __/ /  ___ _____
# | |/|/ / _ `/ // / _ \/ _ `/ __/
# |__,__/\_,_/\_, /_.__/\_,_/_/
#            /___/
#
# -----------------------------------------------------
PROGRAM_NAME="waybar"

if pgrep -x "$PROGRAM_NAME" > /dev/null; then
    pkill -x "$PROGRAM_NAME"
else
    "$PROGRAM_NAME" &
    disown
fi
