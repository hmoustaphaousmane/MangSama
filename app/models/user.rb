class User < ApplicationRecord
    has_many :appreciations
    has_many :mangas, through: :appreciations
    has_many :favorites
    has_many :mangas, through: :favorites
    has_many :comments
end 