class CreateMangas < ActiveRecord::Migration[7.0]
  def change
    create_table :mangas do |t|
      t.string :title
      t.text :synopsis
      t.integer :likes_count
      t.integer :dislikes_count
      t.references :category, null: false, foreign_key: true
      t.string :cover_image

      t.timestamps
    end
  end
end
