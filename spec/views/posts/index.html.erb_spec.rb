require 'spec_helper'

describe "posts/index" do
  let(:post){ FactoryGirl.create(:post) }
  let(:post1){ FactoryGirl.create(:post1) }

  before(:each) do
    assign(:posts, [:post, :post1])
  end

  it "renders a list of posts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
