#!/bin/bash

file1=$1
file2=$2
argument=$3
fourth=$4

if [ ! -e $file1 ] || [ ! -e $file2 ]
then
echo One or both files do not existing
fi

if [ "$argument" == "-count" ] && [ -e $file1 ] && [ -e $file2 ]
then
wordcount=($(wc -l $file1))
echo $wordcount
fi

if [ "$argument" == "-f" ] && [ -e $file1 ] && [ -e $file2 ]
then
	while IFS=$'\t' read name ID1
	do
		while IFS=$'\t' read ID2 course grade
		do
			if [ $ID1 -eq $ID2 ]
			then
				if [ "$4" = "$name" ]
				then
					if [ "$grade" = "" ]
					then
						echo "$course"	in progress
					else
						echo "$course"	"$grade"
					fi
				fi
			fi
		done < $2
	done < $1
fi

if [ "$argument" == "-g" ] && [ -e $file1 ] && [ -e $file2 ]
then
	while IFS=$'\t' read name ID1
	do
		while IFS=$'\t' read ID2 course grade
		do
			if [ $ID1 -eq $ID2 ]
			then
				if [ "$4" = "$name" ]
				then
					if [ "$grade" != "" ]
					then
						echo "$course"	"$grade"
					fi
				fi
			fi
		done < $2
	done < $1
fi

if [ "$argument" == "-c" ] && [ -e $file1 ] && [ -e $file2 ]
then
	counter=0
	while IFS=$'\t' read ID course grade
	do 
		if [ "$course" = "$4" ]
		then
			counter=$((counter+1))
		fi
	done < $2
	echo $counter
fi

if [ "$argument" = "-list" ] && [ -e $file1 ] && [ -e $file2 ]
then
	count=0
	while IFS=$'\t' read ID course grade
	do
		if [ "$grade" = "$4" ]
		then
		count=$((count+1))
		fi
	done < $2
	echo $count
fi	
