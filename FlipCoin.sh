#!/bin/bash/ -x

echo "Welcome to FlipCoin"

head=0
tail=0

random=$(( RANDOM % 2))
if [[ $random -eq 1 ]]
then
	head=$(( head + 1 ))
else
	tail=$(( tail + 1 ))
fi

echo $head
echo $tail
