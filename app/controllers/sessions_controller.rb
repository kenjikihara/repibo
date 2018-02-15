class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to books_path, notice: "ログインしました"
      else
        # flash[:danger] = 'ログインに失敗しました'
        render 'new', notice: "ログインに失敗しました"
      end
  end
  
  def destroy
    session.delete(:user_id)
    # flash[:notice] = 'ログアウトしました'
    redirect_to new_user_path, notice: "ログアウトしました"
  end
end
