class Rating < ActiveRecord::Base
  enum severity: [ :PG, :PG13, :R ]

  has_many :rateables
  has_many :topics, through: :rateables, source: :rate, source_type: :Topic
  has_many :posts, through: :rateables, source: :rate, source_type: :Post

  def self.update_ratings(rating_string)
    return Rating.none if rating_string.blank?
    Rating.find_by(severity: rating)
  end
end
