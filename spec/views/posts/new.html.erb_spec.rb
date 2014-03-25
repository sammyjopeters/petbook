require 'spec_helper'

describe "posts/new" do
  before(:each) do
    assign(:post, stub_model(Post,
      :user => nil,
      :content => "MyText",
      :comments => nil
    ).as_new_record)
  end

  it "renders new post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", posts_path, "post" do
      assert_select "input#post_user[name=?]", "post[user]"
      assert_select "textarea#post_content[name=?]", "post[content]"
      assert_select "input#post_comments[name=?]", "post[comments]"
    end
  end
end
