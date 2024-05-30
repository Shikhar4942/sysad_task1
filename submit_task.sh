#/bin/bash
USER=$(whoami)
USER_HOME=$(eval echo ~$USER)
TASK_FILE="$USER_HOME/task_submitted.txt"
TASK_DIR="$USER_HOME/tasks"
TASK_DOMAIN_DIR="/home/coreadmin/mentors"

mentee_task() {
    echo "enter the task domain :"
    read DOMAIN
    echo "enter task name:"
    read TASK_NAME
    
    DOMAIN_DIR="$TASK_DOMAIN_DIR/$DOMAIN"
    if [ -d "$DOMAIN_DIR" ]; then
       mkdir -p "$TASK_DIR/$DOMAIN/$TASK_NAME"
       echo "task :$TASK_NAME,domain:$DOMAIN" >> $TASK_FILE
    else
       echo "INVALID DOMAIN"
    fi
    }

mentor_task()  {
     DOMAIN=$(basename $(dirname $USER_HOME))
     for MENTEE_DIR in /home/coreadmin/mentees/*; do
        if [ -d "$MENTEE_DIR/tasks/$DOMAIN" ]; then
           for TASK in $MENTEE_DIR/tasks/$DOMAIN/*; do
               TASK_NAME=$(basename $TASK)
               ln -s $TASK "$USER_HOME/tasks/$TASK_NAME"
           done
        fi
     done

     COMPLETED_TASKS="$USER_HOME/task_completed.txt"
     > $COMPLETED_TASKS
     for LINK in $USER_HOME/tasks/*; do
         if [ "$(ls -A $LINK )" ]; then
            echo "$(basename $LINK)" >> $COMPLETED_TASKS
         fi 
     done
 }
 
 if id -nG "$USER" | grep -qw "mentees"; then
     mentee_task
 elif id -nG "$USER" | grep -qw "mentors"; then
     mentor_task
 else 
     echo "user is neither mentee nor mentor "
 fi 
 
 
               

