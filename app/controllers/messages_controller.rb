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
    respond_to do |format|
      if @message.save
        MessageMailer.message_mail(@message).deliver 
        format.html { render :show, notice: 'メッセージを送信しました' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :show}
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end
    def message_params
      params.require(:message).permit(:name, :email, :content, :user_id, :book_id)
    end
end