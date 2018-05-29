class MessagesController < ApplicationController
  before_action :set_message, only: %i[show edit update destroy]
  
  def index
    @messages = Message.all
  end
  
  def new
    @message = Message.new
  end
  
  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      MessageMailer.message_mail(@message).deliver 
      redirect_to message_path(@message), notice: t(:message_create)
    else
      redirect_to book_path(@message.book)
    end
  end
  
  def confirm
    @message = current_user.messages.build(message_params)
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