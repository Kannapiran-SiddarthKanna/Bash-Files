#!/bin/bash
x=$1
y=$2
z=$3
w=$4
count=0

for ((i=1; i<=$x; i++))
do 
    for ((j=1; j<=$y; j++))
    do
        for ((k=1; k<=$z; k++))
        do
            for ((l=1; l<=$w; l++))
            do      
                if [ $(($i * $i * $i + $j * $j * $j)) = $(($k * $k * $k + $l * $l * $l)) ]
                then
                echo x=$i, y=$j, z=$k, w=$l
                count=$(($count+1))
                fi                                                   
            done
        done        
    done
done

if [ $count -eq 0 ] 
then
echo No solution
fi