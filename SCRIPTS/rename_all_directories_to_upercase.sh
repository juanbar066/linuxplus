#!/usr/bin/bash

# List all the directories of the PWD
#newname="$(for i in $(ls -l "$(pwd)" | grep '^d' | cut -d  : -f 2 | cut -d " " -f 2); do
#	echo $i | tr [:lower:] [:upper:] ; done)"
#echo $newname
for i in $(ls -l $PWD | grep '^d' | cut -d  : -f 2 | cut -d " " -f 2); do
	echo $i | tr [:lower:] [:upper:] | xargs mv $i  ;
done	 


