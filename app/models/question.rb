class Question < ActiveRecord::Base
  has_many :question_choices, :dependent => :destroy
  belongs_to  :correct_question_choice, :class_name => 'QuestionChoice'
end