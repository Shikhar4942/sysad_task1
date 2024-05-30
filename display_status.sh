#!/bin/bash
CORE_HOME="/home/coreadmin"
MENTEES_DIR="$CORE_HOME/mentees"
LAST_RUN_FILE="$CORE_HOME/last_display_status_run"
CURRENT_RUN_TIME=$(date +%s)

if [ ! -f "$LAST_RUN_FILE" ]; then
   echo 0 > "$LAST_RUN_FILE"
fi

LAST_RUN_TIME=$(cat "$LAST_RUN_FILE")

DOMAIN_FILTER=$1

display_status() {
        local domain=$1
        echo "domain:$domain"
    
        local task_dirs=("$MENTEES_DIR"/*/tasks/"$domain"/*)
        local total_tasks=0
        local submitted_tasks=0
    
        declare -A mentee_submissions
        for task_dir in "${task_dirs[@]}"; do
             if [ -d "$task_dir" ]; then
                 task_name=$(basename "$task_dir")
                 total_tasks=$((total_tasks + 1))
           
                 for mentee in "$MENTEE_DIR"/*; do
                     mentee_name=$(basename "$mentee")
                     if [ -d "$mentee/tasks/$domain/$task_name" ]; then
                         if [ -n "$(ls -A "$mentee/tasks/$domain/$task_name")" ]; then
                            submitted_tasks=$(( submitted_tasks + 1))
                            mentee_submissions["$mentee_name"]+="$task_name"
                         fi
               fi
           done
        fi
     done
     
     if [ $total_tasks -gt 0 ]; then
        local percentage=$((100*submitted_tasks/total_tasks))
        echo "total percentage of tasks submitted=$percentage"
     else
        echo "no tasks found"
     fi
     
     echo "list of mentees who submitted tasks since last check:"
     for mentee in "${!mentee_submissions[@]}"; do
         if [ $(stat -c %Y "$MENTEES_DIR/$mentee/tasks/$domain") -ge $LAST_RUN_TIME ]; then
            echo "mentee:${mentee_submissions[$mentee]}"
         fi
     done
  }
  if [ -n "$DOMAIN_FILTER" ]; then
     display_status "$DOMAIN_FILTER"
  else
     display_status "webdev"
     display_status "appdev"
     display_status "sysad"
  fi
  
  echo $CURRENT_RUN_TIME > "$LAST_RUN_FILE"
  
               
