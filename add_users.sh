MENTEE_FILE=~/mentees/mentees.txt

while IFS= read -r mentee; do
    sudo useradd -m -d /home/coreadmin/mentees/$mentee $mentee
    sudo mkdir -p /home/coreadmin/mentees/$mentee 
    sudo chown -R $mentee:$mentee /home/coreadmin/mentees/$mentee 

    sudo touch /home/coreadmin/mentees/$mentee/domain_pref.txt
    sudo touch /home/coreadmin/mentees/$mentee/task_completed.txt
    sudo touch /home/coreadmin/mentees/$mentee/task_submitted.txt
    sudo chown $mentee:$mentee /home/coreadmin/mentees/$mentee/*.txt
done< "$MENTEE_FILE"


