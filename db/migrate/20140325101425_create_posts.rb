class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user, index: true
      t.text :content
      t.datetime :date_created
      t.references :comments, index: true

      t.timestamps
    end
  end
end
