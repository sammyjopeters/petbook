require 'spec_helper'

describe "snapshots/new" do
  before(:each) do
    assign(:snapshot, stub_model(Snapshot,
      :user => nil
    ).as_new_record)
  end

  it "renders new snapshot form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", snapshots_path, "post" do
      assert_select "input#snapshot_user[name=?]", "snapshot[user]"
    end
  end
end
