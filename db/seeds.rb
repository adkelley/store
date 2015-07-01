# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'ffaker'
require 'uuid'

# Destroy existing data
StoreIt.destroy_all
Receipt.destroy_all
ApiToken.destroy_all

# create dev store
store_params = {}
store_params[:name] = "developer"
store_params[:email] = "dev@test.com"
store_params[:password] = "fakedata"
store_params[:password_confirmation] = store_params[:password]
new_store = StoreIt.create(store_params)
new_token = ApiToken.new
uuid = UUID.new
new_token.hex_value = uuid.generate
new_token.store_id = new_store.id
new_token.save
num = Random.new
(1..5).each do
  receipt_params = {}
  receipt_params[:transaction_number] = "XXXXXXXX"
  receipt_params[:payment_method] = "VISA ENDING IN " + num.rand(1000).to_s
  receipt_params[:amount] = num.rand(99.99)
  receipt_params[:tip] = receipt_params[:amount] * 0.15
  receipt_params[:total] = receipt_params[:amount] + receipt_params[:tip]
  new_receipt = Receipt.new(receipt_params)
  new_receipt.store_id = new_store.id
  new_receipt.save
end

# create random store
store_params = {}
store_params[:name] = FFaker::Internet.user_name
store_params[:email] = FFaker::Internet.email
store_params[:password] = "fakedata"
store_params[:password_confirmation] = store_params[:password]
new_store = StoreIt.create(store_params)
new_token = ApiToken.new
uuid = UUID.new
new_token.hex_value = uuid.generate
new_token.store_id = new_store.id
new_token.save
num = Random.new
(1..5).each do
  receipt_params = {}
  receipt_params[:transaction_number] = "XXXXXXXX"
  receipt_params[:payment_method] = "VISA ENDING IN " + num.rand(1000).to_s
  receipt_params[:amount] = num.rand(99.99)
  receipt_params[:tip] = receipt_params[:amount] * 0.15
  receipt_params[:total] = receipt_params[:amount] + receipt_params[:tip]
  new_receipt = Receipt.new(receipt_params)
  new_receipt.store_id = new_store.id
  new_receipt.save
end
