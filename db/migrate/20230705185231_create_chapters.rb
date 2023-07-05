class CreateChapters < ActiveRecord::Migration[7.0]
  def change
    create_table :chapters do |t|
      t.references :tome, null: false, foreign_key: true
      t.integer :number
      t.string :title

      t.timestamps
    end
  end
end
