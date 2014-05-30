class Admin::QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.includes(:quiz_responses => :question).all
  end
end
