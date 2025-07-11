#!/usr/bin/bash

# Check if a file exists or not. Note that "$PWD" is a global variable:

read -p "Let's check all the file details. Enter the file name: " file

if [ -e $PWD/$file ]; then
       echo "The file $file exists."

    # Check if the existent file has READ access:
    if ! [ -r $file ]; then
           echo "The file does NOT have READ access."	       
    else 
           echo "The file does have READ access."
    fi

    # Check if the existent file has WRITE access:
    if ! [ -w $file ]; then
           echo "The file does NOT have WRITE access."	       
    else 
           echo "The file does have WRITE access."
    fi

    # Check if the existent file has EXECUTE access:
    if  [ -x $file ]; then
           echo "The file does have EXECUTE access."	       
    else 
           echo "The file does NOT have EXECUTE access."
    fi

    # Check if the existent file is empty or not:
    if ! [ -s $file ]; then
           echo "The file is currently empty."
    else
           echo "The file has contents in it."
    fi
    
    # Check if the existent file has been modified since the last time it was read:
    read -p "Enter the name of the alternative file: " file2
    if [ $file2 -nt $file ]; then
           echo "There is a new version of the file <$file>. Please check it out!!."
    else
           echo "This is the last version of the file <$file>."
    fi

else 
       echo "The file $file does not exist."
fi 


# Check if the file has READ access or not: 

# Check if the file is empty or not
# for 


