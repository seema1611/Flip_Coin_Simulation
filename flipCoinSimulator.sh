#! /bin/bash -x

isHead=1

coinCheck=$((RANDOM%2))
if [ $coinCheck -eq $isHead ]
then
		echo "HEAD"
else
		echo "TAIL"
fi
