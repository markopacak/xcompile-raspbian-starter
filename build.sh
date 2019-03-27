#!/bin/bash


# At the end you will have in the build folder:
# - <<application-name>>-armv7l (solution for PI)
# - <<application-name>>-x86_64 (solution for standard Linux)

echo "## build.sh - 00) Reading properties"

# -------------------------- PROPERTIES READER
# I'm using my bash-properties-reader here that can be found at: https://github.com/markopacak/bash-property-reader

# Place your app.name ecc... in the properties file
FILENAME="./src/application.properties"

# Check if the argument was supplied
if [ $# -eq 0 ]
then
    FILE="$FILENAME"
else
    FILE="$1"
fi

# Check if it's a valid file
if ! [ -f "$FILE" ]
then
    echo "Could not find properties file: " $FILE " - Exiting script..."
    exit 1
fi

# Utility function that removes leading and trailing whitespaces from a string
trim(){
    [[ "$1" =~ [^[:space:]](.*[^[:space:]])? ]]
    printf "%s" "$BASH_REMATCH"
}

# Parse the properties file, ignoring:
#   - empty lines
#   - lines containing only spaces
#   - lines starting with a comment: # comment ...
while IFS="" read -r line || [[ -n "$line" ]]; 
do
    # ignore empty lines
    if [[ "$line" =~ [^[:space:]] ]];
    then
        # ignore comments
        if ! [[ "$line" = \#* ]];
        then
            # Here we have valid lines to be split into [key, value]
            IFS="=" read key value <<< "$line"
            # substitute dots with nothing
            key="$(<<<$(trim "$key") tr -d "." )"
            value=$(trim "$value")
            eval ${key}=\${value}
        fi
    fi
done < "$FILE"

# -------------------------- PROPERTIES READER

cd release

echo "## build.sh - 01.0) x86_64: Start building solution" ${appname}

# store global variable so cmake can read it
export build_type=x86_64

mkdir x86_64
cd x86_64

# See the guide on how to copy libraries

# mkdir lib

# build your src files

cmake ./../../src -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release
cmake --build ./../../src

echo "## build.sh - 01.2) x86_64: Make"


