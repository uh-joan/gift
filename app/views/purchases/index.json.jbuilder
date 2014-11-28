json.array!(@purchases) do |purchase|
  json.extract! purchase, :id, :identifier, :amount, :senderName, :senderEmail, :recipientName, :recipientEmail, :message, :status, :vendor, :completed, :confirmedPayment
  json.url purchase_url(purchase, format: :json)
end
