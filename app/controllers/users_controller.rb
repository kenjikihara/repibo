class UsersController < ApplicationController
    def new
      @user = User.new
    end
    
    def create
      @user = User.new(user_params)
      if @user.save
        UserMailer.user_mail(@user).deliver
        redirect_to new_session_path(@user.id), notice: "登録しました"
        # redirect_to user_path(@user.id)
      else
        render 'new'
      end
    end
    
    def show
      @user = User.find(params[:id])
      # @favorites = current_user.favorite_pictures
    end
    private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation,
                                   :image)
    end
end
