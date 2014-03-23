require 'spec_helper'

describe "pets/index" do
  before(:each) do
    assign(:pets, [
      stub_model(Pet),
      stub_model(Pet)
    ])
  end

  it "renders a list of pets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
