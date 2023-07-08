class CreateMangas < ActiveRecord::Migration[7.0]
  def change
    create_table :mangas do |t|
      t.string :url
      t.string :author_name
      t.string :title
      t.text :synopsis
      t.integer :likes_count
      t.integer :dislikes_count
      t.string :cover_image
      t.integer :volumes
      t.integer :chapters

      t.timestamps
    end
  end
end
