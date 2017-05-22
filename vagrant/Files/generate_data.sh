#!/bin/bash

firstDay=1
lastDay=`date "+%d"`

drinks=("coffe" "cappuccino" "green_tea" "chocko_milk" "espresso")

for day in `seq $firstDay $lastDay`
do

	for i in `seq 1 $1`;
	do
		if [ "$day" -lt 10 ]; 
		then
			day=`printf "%02d" "${day#0}"`
		fi

		date="2017-05-$day"
		echo $date;

		timestamp=`date -d $date "+%s%N"`
		value=`shuf -i 0-50 -n 1` 
		machine=`shuf -i 1-9 -n 1` 
		drink=${drinks[`shuf -i 0-4 -n 1`]} 
		distributor=`shuf -i 1-5 -n 1` 

		data="carimali.vending,dist=$distributor,serial=ca500$machine,drink=$drink value=$value $timestamp"
		
		echo $data;

		curl -i -XPOST "http://localhost:8086/write?db=demo" --data-binary "$data"
#		sleep 1;
	done
done   
