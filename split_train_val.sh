#!/bin/bash

for ((i=0;i<10;++i))
do
	n_val[$i]=0
done

max_val=450

cnt_val=0
cnt=0

while read -r line
do
	image_link=${line%\ *}
	class=${line#*\ }
	rnd=$((RANDOM%4))
	if ((rnd==0&&n_val[class]<max_val))
	then
		echo $line >> validate.txt
		cp train_images/${image_link} validate/${image_link}
		n_val[$class]=$((n_val[class]+1))
	else
		echo $line >> train.txt
		cp train_images/${image_link} train/${image_link}
	fi

	cnt=$((cnt+1))
  
	if ((cnt%500==0))
	then
		echo $cnt file processed		
	fi
done < "all_train.txt"