class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.references :manga, null: false, foreign_key: true
      t.string :name
      t.string :image_url
      t.string :role

      t.timestamps
    end
  end
end
