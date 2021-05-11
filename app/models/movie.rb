class Movie < ApplicationRecord
  has_many :reviews

  validates :name, :description, :year, :director, presence: true
end
