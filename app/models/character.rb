class Character < ApplicationRecord
  belongs_to :manga

  validates :name, presence: true
  validates :image_url, presence: true
  validates :role, presence: true
end
