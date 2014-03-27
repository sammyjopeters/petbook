require 'spec_helper'

describe User do
  context "associations" do
    it { should have_many(:pets).dependent(:destroy) }
    it { should have_many(:posts).dependent(:destroy) }
    it { should have_many(:snapshots).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
  end

  context "paperclip validations" do
    it { should have_attached_file(:picture) }
    it { should validate_attachment_content_type(:picture).
                    allowing('image/png', 'image/gif').
                    rejecting('text/plain', 'text/xml') }
    it { should validate_attachment_size(:picture).
                    less_than(2.megabytes) }
  end
end
