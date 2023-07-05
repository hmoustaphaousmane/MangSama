class Chapter < ApplicationRecord
  belongs_to :tome
  has_many :images

   # Validation des attributs
   validates :title, presence: true
end
