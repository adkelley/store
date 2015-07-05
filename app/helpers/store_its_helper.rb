module StoreItsHelper
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please Log In!"
      redirect_to login_path
    end
  end

  def correct_user
    unless StoreIt.find(params[:id]) == current_user
      flash[:danger] = "You cannot view another store's account information"
      redirect_to(root_url)
    end
  end
end
