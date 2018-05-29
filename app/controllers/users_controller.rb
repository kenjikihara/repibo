class UsersController < ApplicationController
  before_action :correct_user, only: %i[show edit update destroy]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.user_mail(@user).deliver
      redirect_to new_user_path, notice: t(:registration_complete)
    else
      render :new
    end
  end
  
  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: t(:edit_complete)
    else
      render :edit
    end
  end
  
  def destroy
    @user.destroy
    redirect_to books_path, notice: t(:delete)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def correct_user
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to(root_path)
    end
  end  
end