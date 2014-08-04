json.array!(@pictures) do |picture|
  json.extract! picture, :id, :caption, :image_url, :favorite
  json.url picture_url(picture, format: :json)
end
