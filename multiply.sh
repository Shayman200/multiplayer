#!/bin/bash
#!/bin/bash

# Function to check if a number is a perfect square

multiply() {
    num1=$1
    num2=$2
    result=$((num1 * num2))
    echo "The result of multiplying $num1 and $num2 is: $result"
}

# Prompt the user to enter a number
#read -p "Enter a number: " user_input
user_input=$1
# Accept two numbers as input
num1=$1
num2=$2

# Check if both inputs are positive integers
if [[ $num1 =~ ^[0-9]+$ && $num2 =~ ^[0-9]+$ ]]; then
    echo "Inputs are valid: $num1 and $num2"
else
    echo "Invalid input. Please enter two positive integers."
    exit 1
fi
multiply $num1 $num2
