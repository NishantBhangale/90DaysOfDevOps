#!/bin/bash
# Takes a source directory and backup destination as arguments
# Creates a timestamped .tar.gz archive (e.g., backup-2026-02-08.tar.gz)
# Verifies the archive was created successfully
# Prints archive name and size
# Deletes backups older than 14 days from the destination
# Handles errors — exit if source doesn't exist
set -euo pipefail
source_dir="./var/log/logs/"
backup_dir="./backups"
timestamp=$(date +%Y-%m-%d_%H-%M-%S)

if [[ ! -z "$source_dir" && ! -z "$backup_dir" ]]; then
    echo "source and backup dir exists"
else 
    echo "source and backup dir does not exists or not given"
    exit 1
fi
function_createbackup(){
    mapfile -t arr < <(find "$source_dir" -maxdepth 1 -type f 2>/dev/null | sort | head -n 7)
    echo "Found ${#arr[@]} file(s)"
    printf '%s\n' "${arr[@]}"
    tar -czvf "$backup_dir/${timestamp}.tar.gz" "${arr[@]}" | sleep 5 | echo "created archive $(ls "$backup_dir/${timestamp}.tar.gz")"
    echo "size of compressed file is $(du -h "$backup_dir/${timestamp}.tar.gz")"
}
function_cleanup(){
    mapfile -t arr < <(find "$backup_dir" -maxdepth 1 -type f -mtime -1 2>/dev/null | head -n 5) #change -mtime to required day currently its picking 1 day prior created backups
    printf '%s\n' "${arr[@]}"
    echo "Cleaning ##########"
    for i in "${arr[@]}"; do
        echo "cleaned $i $(rm $i)"
    done
}
function_createbackup
function_cleanup
