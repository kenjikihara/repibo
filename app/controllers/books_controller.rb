class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy,]
  before_action :user_logged_in?, only: [:new, :edit,]
  
  def index
    @tags = ActsAsTaggableOn::Tag.most_used
    if params[:tag]
      @books = Book.all.page(params[:page]).per(20).tagged_with(params[:tag]).order(created_at: :desc)
    else
      @books = Book.all.page(params[:page]).per(20).order(created_at: :desc)
    end
    render layout: 'books_index'
  end
  
  def confirm
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    # @book = current_user.books.build(book_params)
    render :new if @book.invalid?
  end
  
  def new
    if params[:back]
      @book = Book.new(book_params)
      @book.image.retrieve_from_cache! params[:cache][:image]
    else
      @book = Book.new
    end
  end
  
  def show
    @book = Book.includes(:user).find(params[:id])
    @message = Message.new
    @message  = @book.messages.build(user_id: current_user.id) if current_user
    if params[:back]
      @message = Message.new(params.require(:message).permit(:name, :email, :content, :user_id, :book_id))
    end
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    # @book = current_user.books.build(book_params)
    @book.image.retrieve_from_cache! params[:cache][:image]
    @book.tag_list.add
    if @book.save
      redirect_to book_path(@book), notice: "投稿しました"
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "更新しました"
    else
      render 'edit'
    end
  end
  
  def destroy
    @book.destroy
    redirect_to books_path, notice:"削除しました"
  end
  
  def tag_cloud
    @tags = Book.tag_counts_on(:tags).order('count DESC')
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :content, :image, :transfer_complete, :tag_list, :image_cache)
  end
  
  def set_book
    @book = Book.find(params[:id])
  end
end