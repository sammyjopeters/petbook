json.array!(@posts) do |post|
  json.extract! post, :id, :user_id, :content, :date_created, :comments_id
  json.url post_url(post, format: :json)
end
