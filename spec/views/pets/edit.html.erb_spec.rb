require 'spec_helper'

describe "pets/edit" do
  before(:each) do
    @pet = assign(:pet, stub_model(Pet))
  end

  it "renders the edit pet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pet_path(@pet), "post" do
    end
  end
end
