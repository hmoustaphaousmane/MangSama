class CreateCategorizations < ActiveRecord::Migration[7.0]
  def change
    create_table :categorizations do |t|
      t.references :manga, foreign_key: true
      t.references :category, foreign_key: true
      
      t.timestamps
    end
  end
end
