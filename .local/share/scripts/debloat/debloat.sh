#!/bin/bash

[[ ! $(which adb) ]] && echo "adb not found" && exit 1

ADB=$(which adb)

source "./list.sh"

printf "\n\tDEBLOATINATOR 2000 v0.1\n\n"
if "$ADB" get-state 1>/dev/null 2>&1;
then

    for i in "${!bloat[@]}";
    do
        if  adb shell pm uninstall -k --user 0 "$i" >/dev/null 2>&1; 
        then
            echo "${bloat[$i]}|SUCESS" | awk -F "|" '{ printf "%-30s %-40s\n", $(NF-1), $NF}'
        else
            echo "${bloat[$i]}|FAILED" | awk -F "|" '{ printf "%-30s %-40s\n", $(NF-1), $NF}'
        fi
    done

else 
    echo "No devices were found" 

fi
