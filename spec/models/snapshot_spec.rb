require 'spec_helper'

describe Snapshot do

  context "associations" do
    it { should belong_to(:user) }
  end

  context "paperclip validations" do
    it { should have_attached_file(:image) }
    it { should validate_attachment_content_type(:image).
                    allowing('image/png', 'image/gif').
                    rejecting('text/plain', 'text/xml') }
    it { should validate_attachment_size(:image).
                    less_than(3.megabytes) }
  end
end
