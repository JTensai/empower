class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :title
      t.string :header_url
      t.string :badge_url
      t.string :source_url
      t.string :ad_url

      t.timestamps
    end
  end
end
