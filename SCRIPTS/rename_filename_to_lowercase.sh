#!/bin/bash

read -p "Enter the name of the file you wish to rename: " filename

newfilename="$(echo $filename | tr [:upper:] [:lower:])"


if [ -z $filename ]; then
   echo "
   
   Please provide a filename
   
   "
   
elif ! [ -e $PWD/$filename ]; then
        echo "
	
	The filename is incorrect or the file does not exist in the current directory
	
	"

   else
        mv $filename $newfilename
fi
