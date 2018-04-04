class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to books_path, notice: t(:logged_in)
    else
      redirect_to new_user_path, notice: t(:can_not_login)
    end
  end
  
  def destroy
    session.delete(:user_id)
    redirect_to new_user_path, notice: t(:logged_out)
  end
end