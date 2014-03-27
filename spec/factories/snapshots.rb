# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :snapshot do
    image_file_name "lolcat.png"
  end
  factory :snapshot_w_pic, class: Snapshot do
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/factories/images/test.png', 'image/png')
  end
end
