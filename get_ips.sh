#!/bin/sh
###############################################################
# $Id$
# Purpose: Fetch denied IP addrs and write to file
###############################################################

# tmp file 
TMPFL="/tmp/hostile_ips.txt"

# read log file for Firewalld
LOGFL="/var/log/messages"

# mon day time hostname srcIP dstPort
grep "FINAL_REJECT" $LOGFL | awk '{ print $1 " " $2 " " $3 " " $10 }' | sed 's/SRC=//' | sort -k 4 | uniq --skip-fields=3  > $TMPFL

# exit gracefully with a return code of 0
exit 0
