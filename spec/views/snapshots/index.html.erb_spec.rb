require 'spec_helper'

describe "snapshots/index" do
  before(:each) do
    assign(:snapshots, [
      stub_model(Snapshot,
        :user => nil
      ),
      stub_model(Snapshot,
        :user => nil
      )
    ])
  end

  it "renders a list of snapshots" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
