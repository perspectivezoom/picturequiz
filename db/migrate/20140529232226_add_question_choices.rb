class AddQuestionChoices < ActiveRecord::Migration
  def change
    create_table :question_choices do |t|
      t.integer :question_id
      t.string :url
 
      t.timestamps
    end
  end
end
