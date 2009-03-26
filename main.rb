# Pulls question set from questions.rb
require 'questions'

# Reset score and question number
score = 0 
question = 1

# Check how many questions the user has answered
while question < 11
  # Equations are picked at random
  i = rand(QUESTIONS.length)
  
  # Shows question to user
  puts "#{question}. #{QUESTIONS[i][0]}"
  answer = gets
  
  # Checking if the answer is correct
  if QUESTIONS[i][1] == answer.chomp
    # Adds one to your score when put the correct answer
    puts "correct"
    score = score + 1
  else 
    # Says incorrect when you put the wrong answer
    puts "incorrect" 
  end
  
  # After you reply to one answer it gives you the next question 
  question = question + 1
end

# Tells you the amount of question you answered correctly out of 10
puts "You answered #{score} of 10 questions correctly"