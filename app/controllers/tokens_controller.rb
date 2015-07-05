class TokensController < ApplicationController
  include StoreItsHelper
  include TokensHelper

  before_action :logged_in_user, only: [:reset, :show]
  before_action :correct_user, only: [:reset, :show]

  def update
  end

  def show
    token = ApiToken.find_by(store_id: current_user.id)
    respond_to do |format|
#      format.html
      format.json { render json: token }
    end
  end

  def reset
    token = ApiToken.find_by(store_id: current_user.id)
    change_token(token)
    respond_to do |format|
      format.html
      format.json { render json: token }
    end
  end

end
