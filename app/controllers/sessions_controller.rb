class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to books_path, notice: "ログインしました"
    else
      redirect_to new_user_path, notice: "ログインできません"
    end
  end
  
  def destroy
    session.delete(:user_id)
    redirect_to new_user_path, notice: "ログアウトしました"
  end
end
