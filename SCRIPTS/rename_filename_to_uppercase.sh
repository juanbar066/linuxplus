read -p "Enter the name of the file you wish to rename: " filename

newfilename="$(echo $filename | tr [:lower:] [:upper:])"

signature() {
	echo "
	
	This script was written by the fackin retard of Escobar.
	
	"

}

if [ -z $filename ]; then
   echo "

   Please provide a filename

   "

   signature 

elif ! [ -e $PWD/$filename ]; then
        echo "

        The filename is incorrect or the file does not exist in the current directory

        "

	signature

   else
        mv $filename $newfilename

	signature
fi
