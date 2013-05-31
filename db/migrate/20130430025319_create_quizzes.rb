class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :name
      t.boolean :live
      t.boolean :scoreable
      t.boolean :image_result
      t.string :image
      t.string :header_url
      t.string :ground_rules
      t.string :ad_url

      t.timestamps
    end
  end
end
