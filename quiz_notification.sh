#/bin/bash
if [[ $PWD == "/home/coreadmin/mentees/"* ]]; then
   quiz_file="/home/coreadmin/quiz_questions.txt"
   answer_file="$PWD/quiz_answers.txt"
   
   
   if [[ -f $quiz_file ]]; then
      echo "you have new quiz questions to answer !"
      cat $quiz_file
      echo "enter your answers(press ctrl+D when done)"
      mentee_answers=$(cat)
      echo "$mentee_answers" >> "$answer_file"
      
      echo "your answers have been saved in $answer_file"
   fi
fi


