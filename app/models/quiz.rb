class Quiz < ActiveRecord::Base
  has_many :quiz_responses, :dependent => :destroy
end