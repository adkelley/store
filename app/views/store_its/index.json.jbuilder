json.array!(@store_its) do |store_it|
  json.extract! store_it, :id, :name, :email, :password_digest
  json.url store_it_url(store_it, format: :json)
end
