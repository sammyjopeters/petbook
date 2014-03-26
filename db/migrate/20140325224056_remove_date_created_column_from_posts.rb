class RemoveDateCreatedColumnFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :date_created
  end
end
