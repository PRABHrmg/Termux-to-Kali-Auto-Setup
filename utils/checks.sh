#!/bin/bash

echo "[*] Checking internet..."

ping -c 1 google.com > /dev/null 2>&1

if [ $? -ne 0 ]; then
    echo "No internet connection ❌"
    exit 1
fi

echo "[*] Checking storage..."

AVAILABLE=$(df /data | tail -1 | awk '{print $4}')

if [ "$AVAILABLE" -lt 2000000 ]; then
    echo "Low storage ⚠️"
fi
