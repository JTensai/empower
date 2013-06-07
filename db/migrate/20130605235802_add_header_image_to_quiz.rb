class AddHeaderImageToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :header_image, :string
    add_column :quizzes, :ad_width, :integer
    add_column :quizzes, :ad_height, :integer
  end
end
