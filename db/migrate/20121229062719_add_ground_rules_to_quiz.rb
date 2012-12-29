class AddGroundRulesToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :ground_rules, :text
  end
end
