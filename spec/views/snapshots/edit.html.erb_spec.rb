require 'spec_helper'

describe "snapshots/edit" do
  before(:each) do
    @snapshot = assign(:snapshot, stub_model(Snapshot,
      :user => nil
    ))
  end

  it "renders the edit snapshot form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", snapshot_path(@snapshot), "post" do
      assert_select "input#snapshot_user[name=?]", "snapshot[user]"
    end
  end
end
