json.array!(@receipts) do |receipt|
  json.extract! receipt, :id, :transaction_number, :payment_method, :amount, :tip, :total
  json.url receipt_url(receipt, format: :json)
end
