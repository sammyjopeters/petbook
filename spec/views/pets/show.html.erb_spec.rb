require 'spec_helper'

describe "pets/show" do
  before(:each) do
    @pet = assign(:pet, create(:pet))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
