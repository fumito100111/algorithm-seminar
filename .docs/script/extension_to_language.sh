#!bin/sh

EXTENSION=$1

if [ "$EXTENSION" == "c" ]; then
    echo "C"

elif [ "$EXTENSION" == "cpp" ]; then
    echo "C++"

elif [ "$EXTENSION" == "py" ]; then
    echo "Python"

elif [ "$EXTENSION" == "java" ]; then
    echo "Java"

fi