class QuizResponse < ActiveRecord::Base
  belongs_to :quiz
  belongs_to :question
  belongs_to :question_choice
end