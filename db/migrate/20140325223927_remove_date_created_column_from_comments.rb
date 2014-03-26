class RemoveDateCreatedColumnFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :created_date
  end
end
