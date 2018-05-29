# TODO: コメント機能 今後実装予定

# class CommentsController < ApplicationController
#   before_action :set_comment, only: %i[show edit update destroy]
#   def index
#     @comments = Comment.all
#   end
#   def show
#   end
#   def new
#     @comment = Comment.new
#   end
#   def edit
#   end
#   def create
#     @comment = Comment.new(comment_params)
#     respond_to do |format|
#       if @comment.save
#         format.html { redirect_to books_path, notice: 'コメントしました' }
#         format.json { render :show, status: :created, location: @comment }
#       else
#         format.html { render :new }
#         format.json { render json: @comment.errors, status: :unprocessable_entity }
#       end
#     end
#   end
#   def update
#     respond_to do |format|
#       if @comment.update(comment_params)
#         format.html { redirect_to @comment, notice: 'コメントを編集しました。' }
#         format.json { render :show, status: :ok, location: @comment }
#       else
#         format.html { render :edit }
#         format.json { render json: @comment.errors, status: :unprocessable_entity }
#       end
#     end
#   end
#   def destroy
#     @comment.destroy
#     respond_to do |format|
#       format.html { redirect_to books_path, notice: 'コメントを削除しました' }
#       format.json { head :no_content }
#     end
#   end

#   private
#     def set_comment
#       @comment = Comment.find(params[:id])
#     end
#     def comment_params
#       params.require(:comment).permit(:user_id, :book_id, :body)
#     end
# end
