json.array!(@pets) do |pet|
  json.extract! pet, :id, :name, :family, :species, :picture, :dob, :favourite_toy, :favourite_place, :bio, :user_id
  json.url pet_url(pet, format: :json)
end
