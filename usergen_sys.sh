#/bin/bash
mentors=("aadit" "avyukkt" "ameya" "ashwani" "guru" "jagan" "jey" "mukund" "purav")

for mentor in "${mentors[@]}"; do
    mentor_home="/home/coreadmin/mentors/appdev/$mentor"
    sudo useradd -m -d $mentor_home $mentor
    sudo mkdir -p $mentor_home/submitted_tasks/tasks{1,2,3}
    sudo touch $mentor_home/allocatedMentees.txt
    sudo chown -R $mentor:$mentor $mentor_home
done

