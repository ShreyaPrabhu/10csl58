#!/bin/bash
rev=""
if [ $# -eq 0 ]
then
	echo " Usage error";
	exit
fi
echo "Total number of arguments: $#";
echo "Arguments: $*";
echo "Arguments in reverse: "
for i in $*
do
	rev=$i" "$rev
done
echo $rev

