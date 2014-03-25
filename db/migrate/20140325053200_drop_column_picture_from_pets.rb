class DropColumnPictureFromPets < ActiveRecord::Migration
  def change
    remove_column :pets, :picture
  end
end
