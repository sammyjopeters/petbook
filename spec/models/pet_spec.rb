require 'spec_helper'

describe Pet do
  describe "associations" do
    it {should belong_to (:user)}
  end

end
