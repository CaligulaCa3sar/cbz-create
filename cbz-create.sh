#!/bin/bash
#
#	Name:		cbz-create.sh
#	Version:	2.2
#	Date:		2022-10-14
#	Usage:		./cbz-create.sh [<directory>...]
#	Description:	Zips image files found in the specified
#			directories into .cbz files named for the
#			containing directory. If no directories
#			are specified, the default behaviour is
#			to attempt to process all sub-directories
#			of the working location.
#

# Variables
EXTENSIONS="*.jpg,*.jpeg,*.png,*.gif"	# Edit this string to add and remove file extensions as required

# Function that creates the .cbz files: 
function cbzCreate()
{
	# Variables
	local d IFS EXTENSIONS
	d="${1}"
	IFS=$(echo -en "\n\b")
	EXTENSIONS="${2},${2^^}"	# Concatenate the original string with an uppercase version

	# Zip the files up into a .cbz archive:
        eval zip -j "${d%/}".cbz "${d}"{"${EXTENSIONS}"};
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
			cbzCreate "${d}"
		done
	else
		printf "\n\nExiting...\n\n"
	fi
else
	# Process the supplied list of directories:
	for d in "${@}";
	do
		cbzCreate "${d}" "${EXTENSIONS}"
	done
fi
