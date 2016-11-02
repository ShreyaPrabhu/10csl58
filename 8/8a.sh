#!/bin/bash
if [ $# -lt 2 ]
then
	echo "Usage error"
	exit
fi
ls -l $1 | cut -d" " -f1 > x
ls -l $2 | cut -d" " -f1 > y
cmp -s x y
if [ $? -eq 0 ]
then 
	echo "Same Permission"
	echo "Permission: `cat x`"
elif [ $? -eq 1 ]
then
	echo "Different Permission"
	echo "File1: $1 Permission1: `cat x`"
	echo "File2: $2 Permission2: `cat y`"
else
	echo "Something went wrong"
fi
rm x y

