class AddFbTextToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :fb_text, :string, default: "On this Quiz I scored: "
  end
end
