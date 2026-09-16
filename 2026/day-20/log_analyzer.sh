#!/bin/bash
#set -euo pipefail

if [ "$#" -eq 0 ]; then
    echo "Argument missing | provide file along with path as an argument"
    exit 1
fi
########## set variables #########
logfile=$1
count_er=0
count_fl=0
line_no=0
date1=$(date +"%d%m%H%M%S")
######## Clear content of old files #######
$(>sample_error.log)
$(>countm)
$(>critical_report.txt)

echo "$1 is received as an log file | searching for file "
    if [ -f $logfile ]; then
        echo "file found | continue "
    else
        echo "file not found"
        exit 1
    fi

function_findcounts(){
while IFS= read -r line; do
    if echo "$line" | grep -q "ERROR"; then
        ((count_er++))
       echo $line >> sample_error.log
    elif  echo "$line" | grep -q "FAILED"; then
        ((count_fl++))
    fi
done < "$logfile" 
# ==============================================================================
# REMINDER: Use input redirection (< "$file") instead of piping into a while 
# loop (cat "$file" | while). Piping runs the loop in a subshell, which causes 
# counter variables (like count_er++) to reset and be lost outside the loop.
# ==============================================================================
    echo "Error : $count_er lines" &&  echo "Failed : $count_fl lines"
}
function_criticalevents(){
echo "##### for critical events #####"
while IFS= read -r line || [ -n "$line" ]; do   ##|| [ -n "$line" ] tells Bash: "Even if read returns an exit code of failure at the end of the file, if $line still contains text, run the loop one last time anyway."
    ((line_no++))
    if echo "$line" | grep -q "CRITICAL"; then
    echo "$line_no and $line"
    fi
done < "$logfile"
} >> critical_report.txt

function_countinstance(){
echo "######################################## printing counts for ERROR types ################"
grep -oE '\[com\.[^]]+\]' sample_error.log | sort | uniq -c | sort -nr > countm
cat countm | head -n 5
} > error_summary.txt
function_report(){
    # 1. Initialize or clear the file first with a single '>'
    echo "========================================" > log_report_$date1.txt
    echo "date of analysis $(date +"%D")" >> log_report_$date1.txt
    echo "Log file name is $logfile" >> log_report_$date1.txt
    echo "total lines processed $line_no" >> log_report_$date1.txt
    echo "total error count is $count_er" >> log_report_$date1.txt
    echo "----------------------------------------" >> log_report_$date1.txt
    echo "Top 5 error messages with their occurrence count:" >> log_report_$date1.txt
    
    cat error_summary.txt >> log_report_$date1.txt
    
    echo "" >> log_report_$date1.txt
    echo "Critical report details:" >> log_report_$date1.txt
    
    cat critical_report.txt >> log_report_$date1.txt
}

function_findcounts
function_criticalevents
function_countinstance
function_report
