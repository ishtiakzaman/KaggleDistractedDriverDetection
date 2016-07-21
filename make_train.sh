#!/bin/bash

if [ -f _temp.txt ]
then
	echo _temp.txt already exists
	exit 1
fi
for file in $(find train_images/*)
do
	if [ -f $file ]
	then
		echo ${file#*/} ${file:14:1} >> _temp.txt
	fi
done
shuf _temp.txt >> all_train.txt
rm -f _temp.txt
