# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    user
    content "MyText"
    date_created "2014-03-25 21:14:25"
    comments nil
  end
  factory :post1 do
    user
    content "MyText Another Post"
    date_created "2014-03-26 21:14:25"
    comments nil
  end
end
