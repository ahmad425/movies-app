class Movie < ApplicationRecord
  GENRES = ["Action", "Adventure","Animation", "Biograpgy", "Comedy", "Crime", "Documentary", "Drama" ,"Fantasy", "History", "Horror" ,"Musical" ,"Mystery" ,"Romance" ,"Sci-Fi" ,"Thriller" ,"War", "Western"]

  validates :name, presence: true, length: { maximum: 80 }
  validates :year, presence: true, length: { is: 4 }
  validate :validate_genres
  validates :director, length: { maximum: 60 }
  validates :main_star, length: { maximum: 60 }
  validates :description, length: { maximum: 400 }

	has_many :favorites, dependent: :destroy
  has_many :favourited_by_users, through: :favorites, source: :user

  def validate_genres
    if self.genres.blank?
      errors.add(:genres, "genres is blank/invalid")
    elsif self.genres.detect { |g| !GENRES.include?(g) }
      errors.add(:genres, "Genre is invalid")
    end
  end
end
