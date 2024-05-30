#!/bin/bash
mentee_list=("Abigail" "Adalynn" "Addison" "Aiden" "Alexander" "Amelia" "Andrew" "Aubrey" "Audrey" "Ava" "Benjamin" "Caleb" "Caroline" "Carter" "Charlotte" "Chloe" "Christian" "Christopher" "Clara" "Colton" "Cooper" "Daniel" "David" "Dylan" "Eleanor" "Elijah" "Elizabeth" "Ella" "Ellie" "Emily" "Emma" "Ethan" "Eva" "Evan" "Evelyn" "Gabriel" "Grace" "Grayson" "Hannah" "Harper" "Hazel" "Henry" "Hudson" "Ian" "Isabella" "Jackson" "James" "Jaxon" "Jonathan" "Joshua" "Julian" "Landon" "Layla" "Leah" "Levi" "Liam" "Lily" "Lincoln" "Lucas" "Lucy" "Luke" "Luna" "Madison" "Mateo" "Matthew" "Maya" "Mia" "Michael" "Mila" "Nathan" "Noah" "Nolan" "Nora" "Oliver" "Olivia" "Paisley" "Penelope" "Riley" "Ryan" "Samuel" "Sarah" "Scarlett" "Sofia" "Sophia" "Stella" "Sydney" "Tyler" "Victoria" "Vivian" "William" "Zoey")
for mentee in "${mentee_list[@]}"; do
   echo "/home/core/quiz_notification.sh" || sudo tee -a /home/coreadmin/mentees/$mentee/.bashrc
done

