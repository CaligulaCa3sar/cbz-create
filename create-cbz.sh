#!/bin/bash
#
#	Name:		create-cbz.sh
#	Version:	2.0
#	Date:		2021-01-26
#	Usage:		./create-cbz.sh [<directory>...]
#	Description:	Zips image files found in the specified
#			directories into .cbz files named for the
#			containing directory. If no directories
#			are specified, the default behaviour is
#			to attempt to process all sub-directories
#			of the working location.
#

# Function that creates the .czb files: 
function createCBZ()
{
	# Variables
	local d IFS
	d="${1}"
	IFS=$(echo -en "\n\b")

	# Zip up the files up into a CBZ archive:
        zip -j "${d%/}".cbz "${d}"{*.jpg,*.jpeg,*.gif,*.png};
}

# Check if arguments have been passed into the script:
if [[ ${#} -eq 0 ]]
then
	# Confirm that the user wants to proceed:
	printf "\nWARNING!\n\n You have not provided references to any directories. The script will default to processing any directories found at the current location:\n\n\t$(pwd)\n\n"
	read -n 1 -r -p "Is this OK? [y/N] " RESPONSE
	
	if [[ "${RESPONSE}" =~ ^[Yy]$ ]]
	then
		for d in */;
		do
			createCBZ "${d}"
		done
	else
		printf "\n\nExiting...\n\n"
	fi
else
	# Process the supplied list of directories:
	for d in "${@}";
	do
		createCBZ "${d}"
	done
fi
