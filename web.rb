# Pulls web handeler library in
require 'rubygems'
require 'sinatra'

# Imports our question set from questions.rb
require 'questions'

# Sets cookies so it can automatically remember it for the future
set :sessions, true

get "/" do
  # When question is 1 score is 0
  session["question"] = 1
  session["score"] = 0
  
  erb :home
end

get "/question" do
  # After answering 10 questions it goes to score
  if session["question"].to_i > 10
    redirect '/score'
  end
  
  # Picks questions at random
  @number = rand(QUESTIONS.length)
  @question = QUESTIONS[@number][0]
  
  # Pulling user's score out of session
  @score = session["score"]
  
  # Sets the question number
  @question_number = session["question"]
  erb :question
end

post "/question/:number/answer" do
  session["question"] = session["question"].to_i + 1
  
  # Goes in numerical order
  number = params['number'].to_i
  
  # Get answer submitted by user
  answer = params["answer"]
  
  # If question is answered correctly score goes up by one.
  if QUESTIONS[number][1] == answer.chomp
    session["score"] = session["score"].to_i + 1
  end
  
  # Goes to next question
  redirect '/question'
end

# Get final score
get "/score" do
  @score = session["score"].to_s
  erb :score
end
