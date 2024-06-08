for i in {001..100}
do
  ./open.py
  raspistill -o open-$i.jpg
  ./close.py
  raspistill -o close-$i.jpg
done

