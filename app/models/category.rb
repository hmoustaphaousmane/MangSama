class Category < ApplicationRecord
    has_many :mangas

     # Validation des attributs 
    validates :name, presence: true
end
