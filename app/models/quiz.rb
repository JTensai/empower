class Quiz < ActiveRecord::Base
  attr_accessible :name, :questions_attributes, :live, :scoreable, :image, :image_result, :remove_image, :header_url, :ad_url, :ground_rules, :header_image, :remove_header_image, :ad_width, :ad_height
  has_many :questions
  has_many :quiz_results, dependent: :destroy
  accepts_nested_attributes_for :questions, allow_destroy: true
  validates_presence_of :name

  mount_uploader :image, QuizImageUploader
  mount_uploader :header_image, QuizHeaderImageUploader

end
