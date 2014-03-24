require 'spec_helper'


describe "Pets request" do
  #include Devise::TestHelpers
    describe "GET /pets" do
      it "arrives successfully" do
        get pets_path
        response.status.should be(302)
      end
  end
end
