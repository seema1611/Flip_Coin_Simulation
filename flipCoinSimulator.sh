#! /bin/bash -x

#Declaration of Dictionary
declare -A coinCombinations

#Constants
SINGLET=1
DOUBLET=2
TRIPLET=3

#Function to generate a combinations
function flipCoin() {

	if [ $((RANDOM%2)) -eq 1 ]
	then
		result+=H
		echo $result
	else
		result+=T
		echo $result
	fi
}

#Function to calculate percentage
function calcPercentage() {

	for result in ${!coinCombinations[@]}
	do
		coinCombinations[$result]=$(($((${coinCombinations[$result]}*100)) / numberOfFlips))
	done
	echo "Percentage : ${coinCombinations[@]}"
	echo "Winning Combinations: $(winning)"
}

#Function to show winning combinations here
function winning() {
	for result in ${!coinCombinations[@]}
	do
		echo $result ${coinCombinations[$result]}
	done | sort -k2 -rn |head -1
}

#Function to findout all combinations
function main() {

	declare -A coinCombinations
	read -p "Enter the number: " numberOfFlips
	numberOfCoins=$1

	for(( i=1; i<=$numberOfFlips; i++))
	do

		result=""
		for(( j=1; j<=$numberOfCoins; j++))
		do
			result=$(flipCoin)
		done

		echo $result
		coinCombinations[$result]=$((${coinCombinations[$result]} + 1))
	done

   echo "Key   : ${!coinCombinations[@]}"
   echo "Count : ${coinCombinations[@]}"

	calcPercentage
}

echo "singlet combination of flipped coin"
main $SINGLET
echo "Doublet combination of flipped coin"
main $DOUBLET
echo "Triplet combination of flipped coin"
main $TRIPLET
