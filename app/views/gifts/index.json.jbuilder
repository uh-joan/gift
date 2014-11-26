json.array!(@gifts) do |gift|
  json.extract! gift, :id, :title, :completed, :lowerAmount, :higherAmount, :redeem, :expiry, :delivery, :shortDescription, :fullDescription, :note, :image, :image_url
  json.url gift_url(gift, format: :json)
end
