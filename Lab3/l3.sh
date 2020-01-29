#!/bin/bash

file1=$1 # file with names and student ID
file2=$2 # file with student ID, course name, and grade
argument=$3 # -count or -f or -g or -c or -list
fourthField=$4 # student name or course name or course grade

#check whether the files exists

if [ ! -e $1 ] || [ ! -e $2 ]
then
echo One or both files do not existing
# if both files exist, then proceed
else
    if [ $argument = -count ] # displays the number of students in the first file
    then
        wordcount=($(wc -l $1))
        echo $wordcount
    elif [ $argument = -f ] # displays all the courses the student has taken seperated and the grade seperated by a tab
                            # if the student does not exist, it displays "No such student: followed by $4"
    then                    # have to read both files and do the thing 
        IFS=$'\t'
        
        while read name ID1
        do 
            if [ $name = $4 ]
            then

            while read ID2  courseCode  grade 
            do 
                if [ $ID1 -eq $ID2 ]
                then
                    if [ "$grade" = "" ]
                    then
                        echo "$courseCode    in progress"
                    else
                        echo "$courseCode    $grade"
                    fi                    
                fi
            done <courses.txt
            fi
        done <names.txt        

    elif [ $argument = -g ] # displays all the courses that student has completed 
    then
        IFS=$'\t'

        while read name ID1
        do
            while read ID2  course  grade
            do
                if [ $name = $4 ]
                then
                    if [ $ID1 -eq $ID2 ]
                    then

                        if [ $grade = "A" ]
                        then
                            echo "$course   $grade"
                        fi
                    fi
                fi
            done <courses.txt
        done <names.txt

    elif [ $argument = -c ] # displays the number of students registered in this course
    then
        numberOfStudentsRegistered=($(grep $4 $2 | wc -l))
        echo $numberOfStudentsRegistered

    elif [ $argument = -list ] # displays the number of students who achieved this grade 
    then
        IFS='\t'
        count=0
        while read ID1  course  grade
        do
            if [ "$grade" = "$fourthField" ];then
            $count=$(($count+1))
            fi
        done <courses.txt
        echo $count

    fi

fi