class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.user_mail(@user).deliver
      redirect_to new_user_path, notice: "会員登録が完了しました"
    else
      render 'new'
    end
  end
  def show
    @user = User.find(params[:id])
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation)
  end
end
