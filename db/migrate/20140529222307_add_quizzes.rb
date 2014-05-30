class AddQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :email
 
      t.timestamps
    end
  end
end
