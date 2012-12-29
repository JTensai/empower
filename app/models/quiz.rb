class Quiz < ActiveRecord::Base
  attr_accessible :ad_url, :badge_url, :header_url, :ground_rules, :source_url, :title

  has_many :questions
end
