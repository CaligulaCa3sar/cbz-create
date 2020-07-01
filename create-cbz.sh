#!/bin/bash
# Save existing $IFS value to a variable for recall later:
SAVEIFS=$IFS

# Assign new value to $IFS:
IFS=$(echo -en "\n\b")

# Loop through directories in the current directory:
for i in */;
do
	zip -j ${i%/}.cbz $i*;
done

# Restore original $IFS value:
IFS=$SAVEIFS
