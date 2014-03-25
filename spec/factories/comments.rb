# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    user nil
    created_date "2014-03-25 21:15:20"
    post nil
    content "MyText"
  end
end
