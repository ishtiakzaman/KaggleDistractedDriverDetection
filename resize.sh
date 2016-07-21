#!/bin/bash

count=0
for file in $(find test_images/*)
do
	if [ -f $file ]
	then
		count=$((count+1))
		convert -crop 480x480+80+0 +repage $file temp.jpg
		convert -resize 256x256 temp.jpg ${file/test_images/test_resized}
	fi
	if [ $((count%500)) -eq 0 ]
	then
		echo $count
	fi
done