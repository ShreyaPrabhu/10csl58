#!/bin/bash
for i in $*
do 
	echo "echo $i is created"
	echo "cat>$i<<EOF"
	cat $i
	echo EOF
done
