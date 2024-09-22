#!/bin/bash

set -e

SCRIPT_DIR=$(dirname "$0")

# stsrt openocd using this folder config file
openocd -f "$SCRIPT_DIR/openocd.cfg" -c "flash write_image erase $SCRIPT_DIR/nice_nano_bootloader-0.6.0_s140_6.1.1.hex" -c "exit"

