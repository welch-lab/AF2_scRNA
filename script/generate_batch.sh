#!/bin/bash

# Initialize a variable to store the directory path
directory=""

#'p:' represent need a command line argument with '-p', and opt is the variable name of -p
while getopts "p:" opt; do
#case starts a case
  case $opt in
# p) represents a p case
    p)
      directory="$OPTARG"
      ;;
# \? represents the situation when it is not p
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done


#]invoke the conditional test, #represent the argument input,-eq represent equal
#The first line is a condition test, whether the input argument is equal to 0, if it is then run the following
if [ -z "$directory" ]; then
#echo is equal to print
  echo "Input Error"
#$0 is a special variable in shell scripts, and it represents the name of the script itself
  echo "Usage: $0 <directory_path>"
#By convention, a non-zero exit status code, such as 1, is used to indicate that an error occurred during the script's execution
  exit 1
#fi is to check the end of if, if youu= have a if then you will have a fi
fi

output_file="sc_batch.txt"
file_counter=0
files_on_line=""
# Check if the directory exists

# Use a for loop to iterate over the files in the directory
#/* is a glob pattern that matches all files and directories within the specified directory
# Check if the item is a file (not a directory)
# Extract just the file name and append it to the output file
# basename is a command that extracts the base name (i.e., the file name without the directory path) from a given path
# "$file" is the variable representing the current file's full path as it is being iterated through the loop.
# echo could also write data to file,>> represents append 


echo "#id file1 file2" >> "$output_file"

if [ -d "$directory" ]; then
  # Use a for loop to iterate over the files in the directory
  for file in "$directory"/*; do
    # Check if the item is a file (not a directory)
    if [ -f "$file" ]; then
      # Extract just the file name
      filename="$file"
      files_on_line="$files_on_line $filename"
      ((file_counter++))
      if [ $((file_counter % 2)) -eq 0 ]; then
        echo "$files_on_line" >> "$output_file"
        files_on_line=""
      fi
    fi
  done
  # If there's an odd number of files, write the remaining one
  if [ ! -z "$files_on_line" ]; then
    echo "$files_on_line" >> "$output_file"
  fi
  echo "File names written to $output_file"
else
  echo "Directory not found: $directory"
  exit 1
fi
