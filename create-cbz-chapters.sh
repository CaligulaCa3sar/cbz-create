#!/bin/bash
#

# Function that creates the .CZB files: 
function createCBZ()
{
	# Variables
	local d IFS
	d="${1}"
	IFS=$(echo -en "\n\b")

	# Zip up the files up into a CBZ archive:
        zip -j "${d%/}".cbz "${d}"*;
}

# Loop through directories in the current directory:
for d in */;
do
	createCBZ "${d}"
done
