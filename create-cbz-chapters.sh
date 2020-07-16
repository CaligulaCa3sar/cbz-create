#!/bin/bash
# Save existing $IFS value to a variable for recall later:
SAVEIFS=$IFS

# Assign new value to $IFS:
IFS=$(echo -en "\n\b")

# Loop through directories in the current directory:
for d in */;
do
	# Zip up the files up into a CBZ archive:
	zip -j ${d%/}.cbz $d*;
done

# Restore original $IFS value:
IFS=$SAVEIFS
