#!/bin/bash/ -x

echo "Welcome to FlipCoin"


read -p "Enter number of the time you want to flip a coin" flipNumber

declare -A flipCoin
coinNum=2
H=0
T=0
for(( i=0;i<$flipNumber;i++))
do
	coin=""
	for(( j=0; j<$coinNum; j++ ))
	do
		random=$(( RANDOM % 2 ))
		if [[ $random -eq 1 ]]
		then
			coin="$coin"H
		else
			coin="$coin"T
		fi
	done

echo "$coin"
flipCoin[$coin]=$(( ${flipCoin[$coin]} + 1 ))
done

for i in ${!flipCoin[@]}
do
	value=${flipCoin[$i]}
	echo "$i $(( ( $value * 100) / $flipNumber))"
done
