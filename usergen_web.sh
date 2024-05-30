#/bin/bash
mentors=("abhinav" "akhshay" "akshay" "arjun" "devesh" "bhoopesh" "dhasrathan" "kavin" "karthik" "kavina" "mani" "raghav" "sriman" "shubham" "subasri" "vignesh" "suhail" "vishrudh")

for mentor in "${mentors[@]}"; do
    mentor_home="/home/coreadmin/mentors/appdev/$mentor"
    sudo useradd -m -d $mentor_home $mentor
    sudo mkdir -p $mentor_home/submitted_tasks/tasks{1,2,3}
    sudo touch $mentor_home/allocatedMentees.txt
    sudo chown -R $mentor:$mentor $mentor_home
done

