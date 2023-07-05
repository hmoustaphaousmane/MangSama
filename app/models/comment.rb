class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :manga

  # Validation des attributs (par exemple, le contenu du commentaire)
  validates :content, presence: true
end
