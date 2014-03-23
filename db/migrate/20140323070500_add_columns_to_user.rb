class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :country, :string
    add_column :users, :gender, :string
    add_column :users, :favourite_animal, :string
    add_column :users, :picture, :text
    add_column :users, :member_since, :datetime
    add_column :users, :pets, :integer
  end
end
