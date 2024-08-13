#!/bin/bash
argument_1=$1
for(( i=2; i<=$#; i++ )); do
	trenutni_argument=${!i}
	if [ "$argument_1" = "$trenutni_argument" ]; then
		echo "Argument $trenutni_argument je enak prvemu"
	else
		echo "Argument $trenutni_argument ni enak prvemu"
	fi
done
