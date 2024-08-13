#!/bin/bash
stevilka_argumenta=0
for element in "$@"
do 
izpis=$(echo "$element" | sed -e 's/a/ha/g' -e 's/e/he/g' -e 's/i/hi/g' -e 's/o/ho/g' -e 's/u/hu/g')
echo "$stevilka_argumenta: $izpis"
stevilka_argumenta=$((stevilka_argumenta+1))
done