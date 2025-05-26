#!/bin/bash

result=""
STATUS=("${@}")
ASSIGNMENTS="$#"

for assignment in $(seq 1 $ASSIGNMENTS) 
do
    if [ "${STATUS[$(($assignment - 1))]}" = "success" ]; then
        result="${result}${assignment}"
    else
        result="${result}0"
    fi
done

MAX="$(seq -s" " 1 $ASSIGNMENTS | tr -d " ")"
"$(dirname "$0")/table.sh" "$result" "$MAX" "1"