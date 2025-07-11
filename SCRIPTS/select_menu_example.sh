#!/usr/bin/bash

echo "Welcome to the ESCOBARS ROOMLAB SUB-CA Server BASH Interactive Menu!"
# Set the PS3 variable to customize the user prompt when using the SELECT conditional construct:
PS3="What are you trying to do today?"

# Define the SELECT command menu:
select action in "Modify the configuration file" "Generate a Server Certificate" "Generate a Client Certificate" "View a CSR" "View a Certificate" "Edit the SERIAL file" "Edit the INDEX file"
do
	case $action in 
		"Modify the configuration file")
			vim /ca/intermediate/openssl_interm
