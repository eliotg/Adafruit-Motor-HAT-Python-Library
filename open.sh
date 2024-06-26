libcamera-vid -n -t 25000 -b 15000000 -o open.h264 &
export RASPIVID_PID=$!
echo Started libcamera-vid

echo Opening sunshade
python open.py

echo Opened.  Waiting 1 sec before stopping video...
sleep 1
echo Stopping video
kill $RASPIVID_PID

echo Converting video
ffmpeg -i open.h264 -c:v copy open.mp4
echo Cleaning up
rm open.h264
