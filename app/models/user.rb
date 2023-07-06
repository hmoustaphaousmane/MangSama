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
end 