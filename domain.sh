#/bin/bash
echo "enter roll no"
read roll_number

echo "enter domain pref 1-3 in ordeer (space sep)"
read -r domains

IFS=' ' read -r -a domain_array <<< "$domains"

mentee_home="/home/coreadmin/mentees/$USER"
for domain in "${domain_array[@]}"; do
    mkdir -p $mentee_home/$domain
    echo $domain >> "$mentee_home/domain_pref.txt"
done

echo "$roll_number ${domains[@]}" | sudo tee -a /home/coreadmin/mentees_domain.txt


echo "domain pref have been recorded"

