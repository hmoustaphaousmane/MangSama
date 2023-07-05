class Appreciation < ApplicationRecord
  belongs_to :user
  belongs_to :manga

  # Validation des attributs (par exemple, la présence d'un like ou d'un dislike)
  validates :liked, inclusion: { in: [true, false] }
end
