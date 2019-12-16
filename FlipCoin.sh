#!/bin/bash/ -x




function flipCoin()
{
declare -A flipCoin
flipNumber=$1
coinNum=$2
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

flipCoin[$coin]=$(( ${flipCoin[$coin]} + 1 ))
done

for i in ${!flipCoin[@]}
do
	value=${flipCoin[$i]}
	echo "$i $(( ( $value * 100) / $flipNumber))"
done | sort -k2 -nr | awk 'NR==1{print $1 "	"	$2}'
}


#Constant
Singlet=1
Doublet=2
Triplet=3

echo "Welcome to FlipCoin"


read -p "Enter number of the time you want to flip a coin" flipNumber

while true
do
read -p "Enter Your Choice  1.Singlet	2.Doublet   3.Triplet" choice
case $choice in

	1)
		flipCoin $flipNumber $Singlet 
		break ;;
	2)
		flipCoin $flipNumber $Doublet 
		break ;;
	3)
		flipCoin $flipNumber $Triplet
		break  ;;
	*)
		echo "Please Enter Correct Choice" 
		;;
esac
done
