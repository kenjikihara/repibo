class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy,]
  before_action :user_logged_in?, only: [:new, :edit,]
  def index
    @tags = ActsAsTaggableOn::Tag.most_used
    if params[:tag]
      @books = Book.page(params[:page]).per(8).tagged_with(params[:tag]).order(updated_at: :desc,transfer_complete: :desc)
    else
      @books = Book.all.order(updated_at: :desc,transfer_complete: :desc,)
      @books = Book.page(params[:page]).per(8)
    end
    render :layout => 'books_index'
  end
  def confirm
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    render :new if @book.invalid?
  end
  def new
    if params[:back]
      @book = Book.new(book_params)
    else
      @book = Book.new
    end
  end
  def show
    @book = Book.includes(:user).find(params[:id])
    @message = Message.new
    @message  = @book.messages.build(user_id: current_user.id) if current_user
    #コメント機能今後実装予定
    # @comment = Comment.new
    # @comment  = @book.comments.build(user_id: current_user.id) if current_user
    # @comments = @book.comments.includes(:user).all
  end
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
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
    # order('count DESC')でカウントの多い順にタグを並べています
    @tags = Book.tag_counts_on(:tags).order('count DESC')
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :content, :image, :transfer_complete, :tag_list)
  end
  def set_book
      @book = Book.find(params[:id])
  end
end
