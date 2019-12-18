class LikesController < ApplicationController
  before_action :find_post
  before_action :find_comment
  before_action :already_liked?

  def create
    respond_to do |format|
      if @comment.likes.create!(author: current_user, value: 1)
        format.js { render 'comments/like', status: :created, location: @post }
      else
        format.html { redirect_to @post, alert: 'You have already liked' }
      end
    end
  end

  def dislike
    respond_to do |format|
      if @comment.likes.create!(author: current_user, value: -1)
        format.js { render 'comments/like', status: :created, location: @post }
      else
        format.html { redirect_to @post, alert: 'You have already disliked' }
      end
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_comment
    @comment = Comment.find(params[:comment_id])
  end

  def already_liked?
    false if Like.where(author_id: current_user.id, comment_id: params[:comment_id]).exists?
  end
end
