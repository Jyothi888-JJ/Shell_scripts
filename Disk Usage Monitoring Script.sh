Disk Usage Monitoring Script
This script calculates the current disk usage of the root file system and compares it against a threshold.

#!/bin/bash

# Sets a default alert threshold of 80%
threshold=${threshold:-80}

# Calculates disk usage: 
# df / (disk free) -> tail -1 (last line) -> awk (5th column) -> sed (remove %)
usage=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

if [ $usage -gt $threshold ]; then
    echo "Disk usage high: $usage%"
    exit 1 # Triggers an alert condition
else
    echo "Disk usage is okay: $usage%"
    exit 0 # Healthy condition
fi


Key Concepts:
Command Chaining: Uses df, tail, awk, and sed together to extract a clean numeric value from system output.

Numerical Comparison: Uses -gt (greater than) to decide if the current usage exceeds the allowed limit.
