class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  
  def index
    @messages = Message.all
  end
  
  def show
  end
  
  def new
      @message = Message.new
  end
  
  def edit
  end
  
  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    if @message.save
      MessageMailer.message_mail(@message).deliver 
      redirect_to message_path(@message), notice: "メッセージを送信しました"
    else
      redirect_to book_path(@message.book)
    end
  end
  
  def confirm
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    render :show if @message.invalid?
  end
  
  private
  
  def set_message
    @message = Message.find(params[:id])
  end
  def message_params
    params.require(:message).permit(:name, :email, :content, :user_id, :book_id)
  end
end