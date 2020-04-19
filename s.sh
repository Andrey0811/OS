#!/bin/bash
IFS=:
if [ -z $1 ] || [ $1 == "-h" ] || [ $1 == "--help" ]
then
echo "use $0 file_name"
echo ""
echo "use only letters and numbers as file_name"
exit
fi
for i in $PATH
do
if [ -e $i/$1 ];
then
echo $i/$1
exit
fi
done
for i in $PWD
do 
if [ -e $i/$1 ];
then
echo $i/$1
exit
fi
done	