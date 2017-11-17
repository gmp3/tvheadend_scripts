#!/bin/bash

for i in `find . -iname \*.txt`; do
  #echo $i
  mkv="${i/%txt/mkv}"
  ts="${i/%txt/ts}"
  if [ -a  $mkv ]; then
    echo "mkv of $i"
  elif [ -a $ts ]; then
    echo "ts of $i"
  else
    rm $i
  fi
done
