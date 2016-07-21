#!/bin/bash

count=0
for file in $(find test/*)
do
	count=$((count+1))
	exiv2 $file | grep "Image size" >> sizes.txt
done
echo $count