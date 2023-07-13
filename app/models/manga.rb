class Manga < ApplicationRecord
  belongs_to :statistic
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :characters
  has_many :comments
  has_many :appreciations
  has_many :users, through: :appreciations
  has_many :favorites
  has_many :users, through: :favorites

  # Validation des attributs
  validates :title, presence: true
  validates :author_name, presence: true
  validates :cover_image, presence: true
  validates :url, presence: true
  validates :synopsis, presence: true


  def likes_count
    appreciations.where(liked: true).count
  end

  def dislikes_count
    appreciations.where(liked: false).count
  end
  
end
