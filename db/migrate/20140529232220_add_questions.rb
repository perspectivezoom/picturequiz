class AddQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question_text
      t.integer :correct_question_choice_id
 
      t.timestamps
    end
  end
end
