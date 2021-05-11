class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :star_rating, presence: true
end
