class CreateAppreciations < ActiveRecord::Migration[7.0]
  def change
    create_table :appreciations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :manga, null: false, foreign_key: true
      t.boolean :liked

      t.timestamps
    end
  end
end
