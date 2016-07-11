#!/bin/bash

# The -origin flag is added for use with import-fixer.php script file by @pippercameron. 
# Delete -origin=$strippedName if you don't care where content came from
files=/path/to/exports/root_folder_of_exports/*

for file in $files
do
	fileName=$(basename $file .xml)
	# removing date/time filename info added by WP on export
	strippedName=${fileName%%.*}
	echo "Importing $file"
	wp import $file --authors=create -origin=$strippedName
done
