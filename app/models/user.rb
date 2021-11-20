class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :username, format: { with: /\A[a-zA-Z0-9]+(?:[_][a-zA-Z0-9]+)*\z/, message: "Only aphanumeric and underscores allowed" }
  has_many :favorites, dependent: :destroy
  has_many :favourite_movies, through: :favorites, :source => :movie
end
