json.array!(@charges) do |charge|
  json.extract! charge, :id, :identifier, :stripeToken, :currency, :amount, :email, :completed
  json.url charge_url(charge, format: :json)
end
