#!/bin/bash
rev=""
j=1
if [ $# -eq 0 ]
then
	echo " Usage error";
	exit
fi
echo "Total number of arguments: $#";
echo "Arguments: $*";
echo "Arguments in reverse: "
while [ $j -le $# ]
do
	eval "k=\$$j"
	rev=$k" "$rev
	j=$((j+1))
done
echo $rev
