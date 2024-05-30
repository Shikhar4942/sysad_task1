#!/bin/bash
if [[ $PWD == "/home/coreadmin/mentees/"* ]]; then
    mentee=$(basename $PWD)
    domain=$(cat /home/coreadmin/mentees/$mentee/domain_pref.txt)
    
    if [ ! -z "$domain" ]; then
       rm -rf /home/coreadmin/mentees/$mentee/$domain
       > /home/coreadmin/mentees/$mentee/domain_pref.txt
       
       echo "deregistration complete for $mentee"
    else
       echo "no domain preference found "
    fi
else
    echo "this script should be run from mentee home directory"
fi
