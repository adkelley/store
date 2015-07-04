module SessionsHelper

  def log_in(store)
    session[:user_id] = store.id
  end

  def current_user
    @current_user ||= StoreIt.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    @current_user = session[:user_id] = nil
  end
end
