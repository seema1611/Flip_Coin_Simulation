#! /bin/bash -x

#Declaration of Dictionary
declare -A flipCoinDictionary

#function to flip coin and check either "H" or "T"
function flipCoin() {

	coinCheck=$((RANDOM%2))
	if [ $coinCheck -eq 1 ]
	then
		echo "H"
	else
		echo "T"
	fi
}

#function to findout percentage of "H" and "T"
function getPercentage() {

	for result in ${!flipCoinDictionary[@]}
	do
		flipCoinDictionary[$result]=$(($((${flipCoinDictionary[$result]}*100))/$numberOfFlips))
	done

	echo "Percentage: ${flipCoinDictionary[@]}"
}

#Main function to findout "H" and "T" flip times
function main() {
	read -p "Enter the number we want to flip: " numberOfFlips

	for(( i=1; i<=$numberOfFlips; i++ ))
	do
		result=$(flipCoin)
		flipCoinDictionary[$result]=$((${flipCoinDictionary[$result]}+1))
	done

	echo "Keys:  ${!flipCoinDictionary[@]}"
	echo "Count: ${flipCoinDictionary[@]}"
	getPercentage
}

#Main function
main
