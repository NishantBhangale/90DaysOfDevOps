#!/bin/bash
set -euo pipefail

log_dir="./var/log/logs/"
zip_dir="./backups"
extract="./extract"
timestamp=$(date +%Y-%m-%d_%H-%M-%S)

function_createdir(){
if [ -d "$zip_dir" ]; then
    echo "dir backups exists"
elif [ -d "$extract" ]; then
    echo "dir extracted exists"
else
    mkdir -p "$zip_dir"
    mkdir -p "$extract"
fi
}
# Find files older than 7 days
# mapfile -t arr < <(find "$log_dir" -maxdepth 1 -type f -mtime +7 2>/dev/null)
function_createbackup(){
mapfile -t arr < <(find "$log_dir" -maxdepth 1 -type f 2>/dev/null | sort | head -n 7)
echo "Found ${#arr[@]} file(s) older than 7 days:"
printf '%s\n' "${arr[@]}"
tar -czvf "$zip_dir/${timestamp}.tar.gz" "${arr[@]}"
}
function_cleanbackup(){
    mapfile -t arr < <(find backups/ -maxdepth 1 -type f 2>/dev/null | sort | head -n 5)
    for i in "${arr[@]}"; do
        rm "$i"
    done
}
function_createdir
function_createbackup
function_cleanbackup
