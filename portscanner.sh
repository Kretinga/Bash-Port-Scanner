#!/bin/bash

empty=""

while [ "$1" != "" ]; do
        case "$1" in
                -i | --ip )         ip="$2";     shift;;
                -p | --ports )          ports="$2"; shift;;
        esac
        shift
done

if [[ $ip == $empty ]]; then
        echo "[!] Specify an IP with -i"
        exit
fi

if [[ $ports == $empty ]]; then
        echo "[!] Specify a range of ports with -p"
        exit
fi

ping -c 1 $ip

echo "-----------------------------------------------------------------------------------------------"


nmap -p- --min-rate 5000 -n -vvv -Pn $ip -oG allPorts.md