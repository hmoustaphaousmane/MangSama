class CreateStatistics < ActiveRecord::Migration[7.0]
  def change
    create_table :statistics do |t|
      t.references :manga, null: false, foreign_key: true
      t.integer :reading
      t.integer :completed
      t.integer :dropped
      t.integer :on_hold
      t.integer :plan_to_read
      t.integer :total
      t.integer :score
      t.integer :votes
      t.integer :percentage

      t.timestamps
    end
  end
end
