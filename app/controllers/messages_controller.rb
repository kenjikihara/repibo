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
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
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