class AddSnapshotsToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :snapshot, index: true
  end
end
