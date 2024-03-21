#!/bin/bash

# Instructions to students:
# 
# Place this script in a new directory called "/home/<username>/Integrity"
# Create a new folder to monitor called "/home/<username>/Monitor"
# update the path in the variable MONITOR_DIR below

MONITOR_DIR="/home/<username>/Monitor"
HASH_FILE="baseline_hashes.txt"

# This function exists to generate two sample files in the Monitor directory
# Students can add or create any other files they wish to monitor
setup_sample_files() {
    echo "hello world" > "MONITOR_DIR"/hello.txt
    echo "sample text" > "MONITOR_DIR"/example.txt
}

# This function is used to generate the baseline hashes for files in the Monitor directory
generate_hashes() {
    for file in "$MONITOR_DIR"/*; do
        sha256sum "$file"
    done
}

# Main script logic starts here
# First check to see if the baseline hashes have been calculated, if not, generate the hash file
if [ ! -f "$HASH_FILE" ]; then
    echo "Baseline hash file does not exist. Generating..."
    generate_hashes > "$HASH_FILE"
    echo "Baseline hash file created."
else
    echo "Baseline hash file found. Comparing current file hashes..."
    
    while IFS= read -r line; do
        # Extract filename and the 'stored hash' from each line
	
        # -----------------
        # STUDENT CODE HERE
        # -----------------
	# [1] Students must write the code to extract filename and stored hash from the line
        # HINT: Use variable assignment with command substitution and the 'cut' command
	# 	Remove the constant strings "PLACEHOLDER" below. e.g filename=$(echo "A command substitution placeholder")
 
        filename="PLACEHOLDER"
	stored_hash="PLACEHOLDER"
        
	# Generate current hash of the file using variable assignment and command substitution with 'sha256sum' and 'cut'
        current_hash=$(sha256sum "$filename" | cut -d ' ' -f 1)
        
        # -----------------
        # STUDENT CODE HERE
        # -----------------
        # [2] Students must write a conditional statement to compare stored_hash and current_hash
        # If they match, echo "File $filename is unchanged."
        # If they do not match, echo "WARNING: File $filename has been modified!"

    done < "$HASH_FILE"
fi

echo "File integrity check complete."


# --------------------------
# STUDENT SHORT ANSWERS HERE
# --------------------------
# Answer the following questions:
# 1. What does the output of the command `cat filename | wc` represent?
#
# 2. Using the `man` page for `wc`, count the total number of lines in auth.log.
# 
# 3. Write a command using `cat` and `grep` to find all lines in the file auth.log which contain an invalid user logon attempt.
#    Ensure your output only contains the lines containing the "input_userauth_request" log events
#
# 4. The following command splits an input using 1 or more spaces as a delimiter and prints out only column N `awk -F ' +' '{print $N}'`
#    What value of N is required to extract the usernames from your output for Q2?
#    HINT: Pipe the output of Q3 into the `awk` command provided and experiment with different values of N.
#
# 5. How many unique invlaid usernames were attempted in auth.log? 
#    HINT: Pipe the output of Q4 into other commands. 
#    HINT: The command `uniq` may not behave as expected unless it receives `sort`ed input.
#    HINT: Review your answer for Q2 to count lines of output
#
