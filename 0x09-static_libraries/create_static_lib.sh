#!/bin/bash

# Collect all .c files in the current directory
c_files=$(find . -maxdepth 1 -type f -name "*.c")

# Check if .c files exist
if [ -z "$c_files" ]; then
  echo "No .c files found in the current directory."
  exit 1
fi

# Compile and create object files for each .c file
object_files=""
for file in $c_files; do
  object_file="${file%.c}.o"
  gcc -c $file -o $object_file
  object_files="$object_files $object_file"
done

# Create the static library
ar rcs liball.a $object_files

# Cleanup: remove object files
rm -f $object_files

echo "Static library liball.a created successfully."
