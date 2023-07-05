class CreateTomes < ActiveRecord::Migration[7.0]
  def change
    create_table :tomes do |t|
      t.references :manga, null: false, foreign_key: true
      t.integer :number

      t.timestamps
    end
  end
end
