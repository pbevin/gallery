json.array!(@photos) do |photo|
  json.extract! photo, :title
  json.url photo_url(photo, format: :json)
end