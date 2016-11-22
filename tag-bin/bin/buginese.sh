#!/bin/bash

for i in {6658..6683}; do
  char=$(echo "obase=16;$i" | bc)
  printf "0x$char: \u$char   \n"
done


