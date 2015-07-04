class PasswordResetsController < ApplicationController
  def new
  end

  def edit
  end

  def create
    @store = StoreIt.find_by(email: params[:password_reset][:email].downcase)
    if @store
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_path
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end
end
