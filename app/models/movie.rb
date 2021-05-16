class Movie < ApplicationRecord
  has_many :reviews, after_add: :update_average_rating, after_remove: :update_average_rating

  validates :description, :director, presence: true
  validates :name, uniqueness: true
  validate :validate_year

  scope :query_movie, ->(query:) { includes(reviews: :user).where('lower(name) LIKE lower(:search)', search: "%#{query}%") }

  private

  def update_average_rating(review = nil)
    return self.average_rating = 0.0 unless reviews.present?

    total_rating = reviews.sum(:star_rating)
    average_rating = total_rating / reviews.size.to_f
    self.update_attribute(:average_rating, average_rating)
  end

  def validate_year
    self.errors.add(:base, "Year should be between 1900 and current year") unless (1900..Date.today.year).include? year.to_i
  end
end
