class Question < ActiveRecord::Base
  attr_accessible :content, :quiz_id, :answers_attributes
  belongs_to :survey
  has_many :answers
  accepts_nested_attributes_for :answers, allow_destroy: true
  validates_presence_of :content
end
