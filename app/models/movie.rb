class Movie < ActiveRecord::Base
  scope :with_ratings, ->(ratings) { where(rating: ratings) if ratings.present? }

  def self.all_ratings
    ['G', 'PG', 'PG-13', 'R']
  end
end
