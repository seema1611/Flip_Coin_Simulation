#! /bin/bash

#Declaration of Dictionary
declare -A coinCombinations

#Constants
DOUBLET=2

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
	echo "Key        : ${!coinCombinations[@]}"
	echo "Percentage : ${coinCombinations[@]}"


}

#Main function to find count of combinations
function main() {
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

echo "Double combination of flipped coin"
main $DOUBLET

