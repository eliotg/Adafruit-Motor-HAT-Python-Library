#!/usr/bin/env bash

# Choose camera command based on what's available
if [ -x /usr/bin/libcamera-hello ]; then
  # New stack: use rpicam-still with your preferred options
  capture() {
    rpicam-still -n --autofocus-mode=manual --lens-position=6 --width=4608 --height=2592 -o "$1"
  }
else
  # Old stack: fall back to raspistill
  capture() {
    raspistill -md 2 -drc high -o "$1"
  }
fi

# Main loop
for i in {001..100}
do
  python open.py
  capture "open-$i.jpg"

  python close.py
  capture "close-$i.jpg"
done
