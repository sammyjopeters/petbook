class AddCommentsToSnapshots < ActiveRecord::Migration
  def change
    add_reference :snapshots, :comment, index: true
  end
end
