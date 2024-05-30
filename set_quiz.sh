#!/bin/bash
if [[ $PWD == "/home/coreadmin/mentors/"* ]]; then
   echo "enter your quiz questions "
   
   quiz_questions=$(cat)
   
   echo "$quiz_questions" | sudo tee /home/coreadmin/quiz_questions.txt
   
   echo "quiz questions have been set"
else
   echo "this should be run from mentor home directory"
fi
   
