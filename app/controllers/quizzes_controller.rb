class QuizzesController < ApplicationController
  def new
  end

  def create
    quiz = Quiz.new(:email => params[:email])
    params[:responses].each do |question_text, url|
      choice = QuestionChoice.find_by_url(url)
      quiz.quiz_responses << QuizResponse.new(:question_choice => choice, :question => choice.question)
    end
    quiz.save
    head :ok 
  end
end
