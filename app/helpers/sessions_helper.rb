module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    !current_user.nil?
  end
  
  def user_logged_in?
    unless logged_in?
      redirect_to new_user_path
    end
  end
end