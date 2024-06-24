libcamera-vid -n -t 25000 -b 15000000 -o close.h264 &
export RASPIVID_PID=$!
echo Started libcamera-vid

echo Closing sunshade
python close.py

echo Closed.  Waiting 1 sec before stopping video...
sleep 1
echo Stopping libcamera-vid
kill $RASPIVID_PID

echo Converting video
ffmpeg -i close.h264 -c:v copy -r 15 -y close.mp4
echo Cleaning up
rm close.h264
