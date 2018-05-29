class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]
  before_action :user_logged_in?, only: %i[new edit]
  before_action :correct_user, only: %i[edit update destroy]
  
  def index
    @tags = ActsAsTaggableOn::Tag.most_used
    if params[:tag]
      @books = Book.limit(20).page(params[:page]).per(20).tagged_with(params[:tag]).order(created_at: :desc)
    else
      @books = Book.limit(20).page(params[:page]).per(20).order(created_at: :desc)
    end
    render layout: 'books_index'
  end
  
  def confirm
    @book = current_user.books.build(book_params)
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
    @book = current_user.books.build(book_params)
    @book.image.retrieve_from_cache! params[:cache][:image]
    @book.tag_list.add
    if @book.save
      redirect_to book_path(@book), notice: t(:post_create)
    else
      render :new
    end
  end
  
  def update
    if @book.update(book_params)
      redirect_to book_path(@book), notice: t(:edit_complete)
    else
      render :edit
    end
  end
  
  def destroy
    @book.destroy
    redirect_to books_path, notice: t(:delete)
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
  
  def correct_user
    @user = User.find(Book.find(params[:id]).user_id)
    if @user != current_user
      redirect_to(root_path)
    end
  end  
end