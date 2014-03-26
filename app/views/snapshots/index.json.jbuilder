json.array!(@snapshots) do |snapshot|
  json.extract! snapshot, :id, :user_id
  json.url snapshot_url(snapshot, format: :json)
end
