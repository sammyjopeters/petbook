# This will guess the Pet class
FactoryGirl.define do
  factory :pet do
    name 'fido'
    family 'dog'
    species 'labrador'
    dob Time.now
    favourite_toy 'rubber ball'
    favourite_place 'the local park!'
    bio "I'm Fido, a dog"
  end
end