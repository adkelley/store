class TokensController < ApplicationController
  include StoreItsHelper
  include TokensHelper

  before_action :logged_in_user, only: [:reset, :show]
  before_action :correct_user, only: [:reset, :show]

  respond_to :json, :html

  def show
    @token = ApiToken.find_by(store_id: current_user.id)
    respond_with @token
  end

  def reset
    @token = ApiToken.find_by(store_id: current_user.id)
    change_token(@token)
    respond_with @token
  end

end
