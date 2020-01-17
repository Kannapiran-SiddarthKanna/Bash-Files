#!/bin/bash 
directory=$1
file=$2
if [ "$#" -ne 2 ] 
then
echo "usage: script_name dir file"
fi

if [ ! -d $1 ]
then
echo $1 is not a directory 
fi

if [ ! -f $1/$2 ]
then 
echo $2 is not a regular file
	elif [ -e $1/$2 ]
	then
	echo file $2 is in directory $1
		elif [ ! -e $1/$2 ]
		then	
		echo file $2 is not in directory $1
fi


