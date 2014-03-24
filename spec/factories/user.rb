# This will guess the User class
FactoryGirl.define do
  factory :user do
    first_name "fred"
    email  "fred@mailinator.com"
    password 'foobareightcharacters'
    password_confirmation 'foobareightcharacters'
  end
end