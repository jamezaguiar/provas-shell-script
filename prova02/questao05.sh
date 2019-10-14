#!/bin/bash
DIR1=$1
DIR2=$2
for i in $(ls $DIR1); do
  ymd=$(date -r $DIR1/$i +%Y/%m/%d)
  mkdir -p $DIR2/$ymd
  cp -p $DIR1/$i $DIR2/$ymd
done
