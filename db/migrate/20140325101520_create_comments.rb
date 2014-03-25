class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true
      t.datetime :created_date
      t.references :post, index: true
      t.text :content

      t.timestamps
    end
  end
end
