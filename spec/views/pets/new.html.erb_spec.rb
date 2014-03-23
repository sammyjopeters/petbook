require 'spec_helper'

describe "pets/new" do
  before(:each) do
    assign(:pet, stub_model(Pet).as_new_record)
  end

  it "renders new pet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pets_path, "post" do
    end
  end
end
