class Manga < ApplicationRecord
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :tomes
  has_many :comments
  has_many :appreciations
  has_many :users, through: :appreciations
  has_many :favorites
  has_many :users, through: :favorites

  # Validation des attributs
  validates :title, presence: true
  validates :synopsis, presence: true
end
