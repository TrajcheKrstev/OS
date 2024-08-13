#!/bin/bash
prikazi_comm=1
prikazi_user=1
prikazi_mem=1
prikazi_cpu=1
function branje {
case $1 in
	(q) exit;;
	(h) 
	    echo "q - izhod iz programa" 
	    echo "h - izpis pomoci"
	    echo "c - menjava vidnosti izpisa ukaza"
	    echo "m - menjava vidnosti izpisa porabe pomnilnika"
	    echo "p - menjava vidnosti izpisa zasedenosti cpu"
	    echo "u - menjava izpisa uporabnika"
	    read tipka
	    branje $tipka;;
	(c)
	    if [[ prikazi_comm -eq 1 ]]; 
	    then prikazi_comm=0; 
	    else prikazi_comm=1;
	    fi;;
	(m)
	    if [[ prikazi_mem -eq 1 ]];
	    then prikazi_mem=0;
	    else prikazi_mem=1;
	    fi;;
	(p)
	    if [[ prikazi_cpu -eq 1 ]];
	    then prikazi_cpu=0;
	    else prikazi_cpu=1;
	    fi;;
	(u)
	    if [[ prikazi_user -eq 1 ]];
	    then prikazi_user=0;
	    else prikazi_user=1;
	    fi;;    
	esac
return
}
while true; do
if [[ prikazi_comm -eq 1 && prikazi_user -eq 1 && prikazi_mem -eq 1 && prikazi_cpu -eq 1 ]];
then ps -eo pid,comm,%mem,user,%cpu --sort=-%cpu | head -10;
elif [[ prikazi_comm -eq 1 && prikazi_user -eq 1 && prikazi_mem -eq 0 && prikazi_cpu -eq 1 ]];
then ps -eo pid,comm,user,%cpu --sort=-%cpu | head -10;
elif [[ prikazi_comm -eq 1 && prikazi_user -eq 0 && prikazi_mem -eq 1 && prikazi_cpu -eq 1 ]];
then ps -eo pid,comm,%mem,%cpu --sort=-%cpu | head -10;
elif [[ prikazi_comm -eq 0 && prikazi_user -eq 1 && prikazi_mem -eq 1 && prikazi_cpu -eq 1 ]];
then ps -eo pid,%mem,user,%cpu --sort=-%cpu | head -10;
elif [[ prikazi_comm -eq 1 && prikazi_user -eq 1 && prikazi_mem -eq 1 && prikazi_cpu -eq 0 ]];
then ps -eo pid,comm,%mem,user --sort=-%cpu | head -10;
elif [[ prikazi_comm -eq 1 && prikazi_user -eq 0 && prikazi_mem -eq 1 && prikazi_cpu -eq 0 ]];
then ps -eo pid,comm,%mem --sort=-%cpu | head -10;
elif [[ prikazi_comm -eq 0 && prikazi_user -eq 1 && prikazi_mem -eq 0 && prikazi_cpu -eq 1 ]];
then ps -eo pid,user,%cpu --sort=-%cpu | head -10;
elif [[ prikazi_comm -eq 1 && prikazi_user -eq 1 && prikazi_mem -eq 0 && prikazi_cpu -eq 0 ]];
then ps -eo pid,comm,user --sort=-%cpu | head -10;
elif [[ prikazi_comm -eq 0 && prikazi_user -eq 0 && prikazi_mem -eq 1 && prikazi_cpu -eq 1 ]];
then ps -eo pid,%mem,%cpu --sort=-%cpu | head -10;
elif [[ prikazi_comm -eq 1 && prikazi_user -eq 0 && prikazi_mem -eq 0 && prikazi_cpu -eq 1 ]];
then ps -eo pid,comm,%cpu --sort=-%cpu | head -10;
elif [[ prikazi_comm -eq 0 && prikazi_user -eq 1 && prikazi_mem -eq 1 && prikazi_cpu -eq 0 ]];
then ps -eo pid,%mem,user --sort=-%cpu | head -10;
elif [[ prikazi_comm -eq 0 && prikazi_user -eq 0 && prikazi_mem -eq 0 && prikazi_cpu -eq 1 ]];
then ps -eo pid,%cpu --sort=-%cpu | head -10;
elif [[ prikazi_comm -eq 0 && prikazi_user -eq 0 && prikazi_mem -eq 1 && prikazi_cpu -eq 0 ]];
then ps -eo pid,%mem --sort=-%cpu | head -10;
elif [[ prikazi_comm -eq 0 && prikazi_user -eq 1 && prikazi_mem -eq 0 && prikazi_cpu -eq 0 ]];
then ps -eo pid,user --sort=-%cpu | head -10;
elif [[ prikazi_comm -eq 1 && prikazi_user -eq 0 && prikazi_mem -eq 0 && prikazi_cpu -eq 0 ]];
then ps -eo pid,comm --sort=-%cpu | head -10;
elif [[ prikazi_comm -eq 0 && prikazi_user -eq 0 && prikazi_mem -eq 0 && prikazi_cpu -eq 0 ]];
then ps -eo pid --sort=-%cpu | head -10;
fi
read -t 1 tipka
branje $tipka
done