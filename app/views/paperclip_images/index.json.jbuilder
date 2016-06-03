json.array!(@paperclip_images) do |paperclip_image|
  json.extract! paperclip_image, :id, :avatar
  json.url paperclip_image_url(paperclip_image, format: :json)
end
