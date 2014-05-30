class AddQuizResponses < ActiveRecord::Migration
  def change
    create_table :quiz_responses do |t|
      t.integer :quiz_id
      t.integer :question_id
      t.integer :question_choice_id
 
      t.timestamps
    end

    add_index :quiz_responses, [:quiz_id, :question_id, :question_choice_id], :unique => true, :name => 'index_quiz_responses_on_quiz_and_question_and_question_choice'
  end
end
