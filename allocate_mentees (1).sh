#!/bin/bash
MENTOR_FILE="/home/core/mentorDetails.txt"
MENTEES_DIR="/home/coreadmin/mentees"

declare -A mentor_capacity
declare -A mentor_current_count

while IFS=' ' read -r mentor capacity; do
      mentor_capacity["$mentor"]=$capacity
      mentor_current_count["$mentor"]=0
done < "$MENTOR_FILE"

for mentee_dir in $MENTEES_DIR/*; do
    mentee=$(basename "$mentee_dir")
    for mentor in "${!mentor_capacity[@]}"; do
       if (( mentor_current_count["$mentor"] < mentor_capacity["mentor"] )); then
           echo "$mentee" >> "/home/coreadmin/mentors/${mentor%_*}/$mentor/allocatedMentees.txt"
           mentor_current_count["$mentor"]=$((mentor_current_count["$mentor"] +1))
           break
       fi
    done
done

