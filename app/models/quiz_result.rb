class QuizResult < ActiveRecord::Base
  # attr_accessible :title, :body

  has_many :questions
  belongs_to :quiz
  accepts_nested_attributes_for :questions, allow_destroy: true

end
