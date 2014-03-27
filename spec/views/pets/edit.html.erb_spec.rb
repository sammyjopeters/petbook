require 'spec_helper'

describe "pets/edit" do
  before(:each) do
    @pet = assign(:pet, create(:pet))
  end

  it "renders the edit pet form" do
    render
    rendered.should have_selector('form', method: 'post', action: pets_path ) do |form|
       form.should have_selector('input', type: 'submit')
    end

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pet_path(@pet), "post" do
    end

  end
end
