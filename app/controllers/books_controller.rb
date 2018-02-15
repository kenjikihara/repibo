class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy,]
  before_action :user_logged_in?, only: [:new, :edit,]
  def index
    
    # @books = Book.all
    @tags = ActsAsTaggableOn::Tag.most_used
    
    if params[:tag]
      @books = Book.tagged_with(params[:tag]).order(created_at: :desc)
    else
      @books = Book.all.order(created_at: :desc)
    end
    
    render :layout => 'home'
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
    render :layout => 'new'
  end
  def show
    @book = Book.includes(:user).find(params[:id])
    # @comment = Comment.new
    # @comment  = @book.comments.build(user_id: current_user.id) if current_user
    # @comments = @book.comments.includes(:user).all
    @message = Message.new
    @message  = @book.messages.build(user_id: current_user.id) if current_user
  end
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id #現在ログインしているuserのidをbookのuser_idカラムに挿入する。User exam errorになるため
    @book.image.retrieve_from_cache! params[:cache][:image]
    @book.tag_list.add
    # if params[:cache].present?
    # end#confirmからの画像キャッシュ https://qiita.com/mana-bin/items/388e41c6a3e8ba615fc4
    if @book.save
      # BookMailer.book_mail(@book).deliver  ##BookMailer、book_mailメソッドにてメールを送信
      redirect_to book_path(@book), notice: "投稿しました"
    else
      render 'new'
    end
  end
  def edit
  end
  def update
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "編集しました"
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
    params.require(:book).permit(:title, :content, :image, 
                                 :transfer_complete, :tag_list)
  end
  def set_book
      @book = Book.find(params[:id])
  end
end
