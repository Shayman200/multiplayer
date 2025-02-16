#!/bin/bash

# Get the input numbers from command-line arguments
num1=$1
num2=$2

# Validate input: Ensure both inputs are numbers
if ! [[ "$num1" =~ ^-?[0-9]+$ ]] || ! [[ "$num2" =~ ^-?[0-9]+$ ]]; then
    echo "Error: Both inputs must be valid integers."
    exit 1
fi

# Perform multiplication
result=$((num1 * num2))

# Output the result
echo "$result"
