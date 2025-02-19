#!/bin/bash

# Exit full script on interrupt
trap "exit" INT

# Check for args
if [ $# -eq 0 ]; then
    echo "Usage: $0 <test-directory>"
    exit 1
fi

# Get test files
testDir=$1
doNotTestPattern="error/[^/]*\\.frg"
testFiles="$( find $testDir -type f \( -name "*.rkt" -o -name "*.frg" \) | grep --invert-match ${doNotTestPattern} )"
numTestFiles="$(echo "$testFiles" | wc -l)"

# Helper variables
breakLine="-------------------------------------------\n"
exitCode=0

# Print header of test files found
echo -e "Found the following $numTestFiles test files:\n$breakLine$testFiles\n$breakLine"

# Run tests and report progress
for testFile in $testFiles; do
    echo -e "\nRunning $testFile"
    
    racket $testFile > /dev/null
    testExitCode=$?

    if [[ $testExitCode -ne 0 ]]; then
        echo "Test failed with code $testExitCode"
        exitCode=1
    fi
done

exit $exitCode
