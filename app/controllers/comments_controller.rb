class CommentsController < ApplicationController
  before_action :require_login, only: %i[create edit update destroy]
  before_action :find_post
  before_action :find_comment, only: %i[show edit update destroy]
  before_action :owner, only: %i[edit update destroy]

  def index
    @post.comments = @post.comments.arrange(order: :created_at)
  end

  def new
    # ancestry
    @comment = Comment.new(parent_id: params[:parent_id])
  end

  def create
    @comment = @post.comments.create(comment_params)
    @comment.author_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
      else
        format.html { redirect_to @post, alert: @comment.errors.full_messages.first }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @post, notice: 'Comment was successfully updated.' }
      else
        format.html { redirect_to @post, alert: 'Smth went wrong..' }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @comment.destroy
        format.html { redirect_to @post, notice: 'Comment was successfully destroyed.' }
      else
        format.html { redirect_to @post, alert: 'Smth went wrong..' }
      end
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_comment
    @comment = @post.comments.find(params[:id])
  end

  def owner
    if @comment.author_id == @current_user.id || (@current_user.admin == true)
    else
      respond_to do |format|
        format.html { redirect_to @post, alert: 'You have no rights' }
      end
    end
  end

  def comment_params
    params.require(:comment).permit(:comment, :author_id, :post_id, :parent_id)
  end
end
