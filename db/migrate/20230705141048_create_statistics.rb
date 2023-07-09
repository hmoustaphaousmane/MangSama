class CreateStatistics < ActiveRecord::Migration[7.0]
  def change
    create_table :statistics do |t|
      t.integer :reading
      t.integer :on_hold
      t.integer :completed
      t.integer :dropped
      t.integer :plan_to_read
      t.integer :total
      t.float :score
      t.integer :votes
      t.float :percentage

      t.timestamps
    end
  end
end
