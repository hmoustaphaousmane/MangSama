class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :birth, :date
    add_column :users, :bio, :text
    add_column :users, :avatar, :boolean, default: false
  end
end
