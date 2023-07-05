class Tome < ApplicationRecord
  belongs_to :manga
  has_many :chapters

  # Validation des attributs
  validates :number, presence: true
end
