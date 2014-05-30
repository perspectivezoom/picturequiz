class QuestionsController < ApplicationController
  def index
    data = []
    Question.includes(:question_choices).all.shuffle.each do |question|
      data << { :question => question.question_text, :choices => question.question_choices.map(&:url).shuffle }
    end
    render :json => data
  end
end
