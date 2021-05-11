class Movie < ApplicationRecord
  has_many :reviews, after_add: :update_average_rating, after_remove: :update_average_rating

  validates :name, :description, :year, :director, presence: true

  scope :query_movie, ->(query:) { includes(reviews: :user).where('lower(name) LIKE lower(:search)', search: "%#{query}%") }

  private

  def update_average_rating(review = nil)
    return self.average_rating = 0.0 unless reviews.present?

    total_rating = reviews.sum(:star_rating)
    average_rating = total_rating / reviews.size.to_f
    self.update_attribute(:average_rating, average_rating)
  end
end
