require 'spec_helper'

describe Pet do
  context "associations" do
    it { should belong_to(:user) }
  end

  context "paperclip validations" do
    it { should have_attached_file(:picture) }
    it { should validate_attachment_content_type(:picture).
                    allowing('image/png', 'image/gif').
                    rejecting('text/plain', 'text/xml') }
    it { should validate_attachment_size(:picture).
                    less_than(2.megabytes) }
  end


  context "#age" do
    let(:pet){ create(:pet) }
    it "returns 5 if the pet was born 5 years ago" do
      pet.dob = 5.years.ago
      expect(pet.age).to eq(5)
    end

    it "returns 0 if the age is today" do
      pet.dob = Time.now
      expect(pet.age).to eq(0)
    end

    it "returns something nice if the date of birth is nil" do
      pet.dob = nil
      expect(pet.age).to be_nil
    end

  end


end
