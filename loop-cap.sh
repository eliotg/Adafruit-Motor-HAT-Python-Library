for i in {001..100}
do
  python open.py
  libcamera-still -o open-$i.jpg
  python close.py
  libcamera-still -o close-$i.jpg
done

