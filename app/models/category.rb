class Category < ApplicationRecord
    has_many :categorizations
    has_many :mangas, through: :categorizations

     # Validation des attributs 
    validates :name, presence: true
end
