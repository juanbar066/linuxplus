#!/usr/bin/bash

read -p "How many pull-ups you did?: " Pullups

read -p "What was your plank time? (please enter value in minutes:seconds): " plank
Plank="$(echo $plank | tr -d ":")"

read -p "What was your run time? (please enter value in minutes:seconds): " run
Run="$(echo $run | tr -d ":")"

if [ $Pullups -gt 5 -a $Plank -gt 0130 -a $Run -lt 2700 ]; then
	echo "You have passed the PFT, and"
	if [ $Pullups -ge 20 -a $Plank -ge 0345 -a $Run -lt 2400 ]; then
		echo "you have a 1st class PFT."
	elif [ $Pullups -ge 10 -a $Plank -ge 0245 -a $Run -lt 2600 ]; then
		echo "you have a 2nd class PFT."
	else 
		echo "you have a 3rd class PFT."
	fi
else 
	echo "You failed the PFT."
fi
