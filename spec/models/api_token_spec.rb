require 'rails_helper'
require 'ffaker'

RSpec.describe ApiToken, type: :model do
  before (:each) do
    params = {}
    params[:name] = FFaker::Name.name
    params[:email] = FFaker::Internet.email
    params[:password] = "blah45"
    params[:password_confirmation] = "blah45"
    @store = StoreIt.create(params)
  end

  it "creates a security token for a new user" do
    token = ApiToken.find_by(store_id:, @store.id)
  end
end
