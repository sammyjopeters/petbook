class CreateSnapshots < ActiveRecord::Migration
  def change
    create_table :snapshots do |t|
      t.references :user, index: true

      t.timestamps
    end
  end
end
