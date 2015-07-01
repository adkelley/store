require 'rails_helper'
require 'ffaker'

RSpec.describe StoreIt, type: :model do
  before (:each) do
    params = {}
    params[:name] = FFaker::Name.name
    params[:email] = FFaker::Internet.email
    params[:password] = "blah45"
    params[:password_confirmation] = "blah45"
    @store = StoreIt.create(params)
  end
  
  it "does something soon" do
  end
end
