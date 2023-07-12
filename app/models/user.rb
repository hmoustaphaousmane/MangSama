class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :appreciations
  has_many :mangas, through: :appreciations
  has_many :favorites
  has_many :mangas, through: :favorites
  has_many :comments

  has_one_attached :profile_photo

  def like(manga)
    appreciation = Appreciation.find_or_initialize_by(user_id: id, manga_id: manga.id)
    appreciation.liked = true
    appreciation.save
  end
  
  def dislike(manga)
    appreciation = Appreciation.find_or_initialize_by(user_id: id, manga_id: manga.id)
    appreciation.liked = false
    appreciation.save
  end
  
end

