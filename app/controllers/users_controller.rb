class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy,]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.user_mail(@user).deliver
      redirect_to new_user_path, notice: "登録が完了しました"
    else
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "更新しました"
    else
      render :edit
    end
  end
  
  def destroy
    @user.destroy
    redirect_to books_path, notice:"ユーザー情報を削除しました"
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation)
  end
  
  def set_user
      @user = User.find(params[:id])
  end
end
