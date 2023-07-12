class User < ApplicationRecord
  attr_accessor :login

  # Validations 
  validates :username,
  presence: true,
  uniqueness: {case_sensitive: false},
  format: {with: /\A[a-zA-Z0-9 _\.]*\z/}

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
end