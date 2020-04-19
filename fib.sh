#!/bin/bash
IFS=:
if [ -z $1 ] || [ "$1" == -h ] || [ "$1" == "--help" ]
then
echo "use $0 Number"
echo "do not use negative number"
exit
fi
f1=0
f2=1
n=$1
t=0
if [ $n -ge $t ]
then
i=1
while [ $i -le $n ]
do
let "d=$f2+$f1"
f1=$f2
f2=$d
let "i+=1"
done
let "d=$f1+$f2"
echo $d
fi
