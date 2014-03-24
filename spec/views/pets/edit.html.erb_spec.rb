require 'spec_helper'

describe "pets/edit" do
  before(:each) do
    @pet = assign(:pet, create(:pet))
  end

  it "renders the edit pet form" do
    pending "until we figure out view specs"
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pet_path(@pet), "post" do
    end
  end
end
