class AddHeaderTypeAdHeaderAdTextToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :header_type, :string, default: "image"
    add_column :quizzes, :ad_header, :string
    add_column :quizzes, :ad_text, :string
  end
end
