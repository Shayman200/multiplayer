#!/bin/bash

# Get input numbers from Jenkins
num1=$1
num2=$2

# Check if inputs are numbers
if ! [[ "$num1" =~ ^[0-9]+$ ]] || ! [[ "$num2" =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter two positive integers."
    exit 1
fi

# Perform multiplication
result=$((num1 * num2))

# Print the result
echo "The product of $num1 and $num2 is: $result"
