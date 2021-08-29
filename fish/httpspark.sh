#!/usr/bin/bash

cat /var/log/nginx/access.log | 
    cut -d\  -f 4 | 
    cut -d/ -f 1 | 
    uniq -c | 
    awk '{print $1}'| 
    spark

