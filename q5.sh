#!/bin/bash

# Task 1: Prompt the user to enter the name of a directory.
read -p "Enter the name of a directory: " input_dir

# Task 2: Check if the directory exists. If it doesn't, display an error message and exit the program.
if [ ! -d "$input_dir" ]; then
  echo "Error: The directory does not exist."
  exit 1
fi

# Task 3: List all the files in the given directory.
echo "Files in the directory:"
ls -p "$input_dir" | grep -v /    # List files and exclude directories

# Task 4: Sort the files alphabetically.
sorted_files=$(ls -p "$input_dir" | grep -v / | sort)

# Task 5: Create a new directory named "sorted" inside the given directory.
sorted_dir="$input_dir/sorted"
mkdir -p "$sorted_dir"    # -p option to avoid errors if the directory already exists

# Task 6: Move each file from the original directory to the "sorted" directory.
count=0
for file in $sorted_files; do
  mv "$input_dir/$file" "$sorted_dir/"
  ((count++))
done

# Task 7: Display a success message with the total number of files moved.
echo "Successfully moved $count files to the 'sorted' directory."

exit 0
