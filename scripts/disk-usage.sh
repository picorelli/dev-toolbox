#!/usr/bin/env bash
# Show a summary of disk usage for the current directory tree
threshold="${1:-50}"
du -sh -- */ 2>/dev/null | sort -h | awk -v t="$threshold" '{ size=$1; unit=substr(size, length(size)); val=substr(size,1,length(size)-1); if (unit=="G" || (unit=="M" && val+0 >= t)) print}'
