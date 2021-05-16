class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :star_rating, presence: true, inclusion: { in: 1..5, message: "should be between 1 and 5" }
  validates :user_id, uniqueness: { scope: [:movie_id], message: "already rated this movie!" }
end
