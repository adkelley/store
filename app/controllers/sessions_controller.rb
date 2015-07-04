class SessionsController < ApplicationController
  def new
  end
  
  def create
    store = StoreIt.find_by(email: params[:session][:email].downcase)
    if store && store.authenticate(params[:session][:password])
      # Log the store in && send them to their profile page
      log_in store
      redirect_to store
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
