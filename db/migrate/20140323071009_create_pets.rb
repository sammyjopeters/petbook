class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :family
      t.string :species
      t.text :picture
      t.datetime :dob
      t.string :favourite_toy
      t.string :favourite_place
      t.text :bio
      t.references :user, index: true

      t.timestamps
    end
  end
end
