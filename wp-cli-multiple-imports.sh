# The -origin flag is added for use with import-fixer.php script file by @pippercameron. Just delete if you don't care where content came from

#!/bin/bash
files=/path/to/exports/root_folder_of_exports/*

for file in $files
do
	fileName=$(basename $file .xml)
	# removing date/time filename info added by WP on export
	strippedName=${fileName%%.*}
	echo "Importing $file"
	wp import $file --authors=create -origin=$strippedName
done
