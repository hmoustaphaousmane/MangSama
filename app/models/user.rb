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
  
  # Methode qui permet de se connecter avec le username
  def self.find_first_by_auth_conditions(warden_conditions) # warden_conditions est l'outil d'authentification utilisé derière devise
    conditions = warden_conditions.dup    
    if login = conditions.delete(:login)
      where(conditions.to_hash).where("lower(username) = :value OR lower(email) = :value", value: login.downcase).first
    else
      where(conditions.to_hash)
    end
      
  end
end