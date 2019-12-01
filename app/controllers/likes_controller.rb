class LikesController < ApplicationController
  before_action :find_post

  def create
    @comment = Comment.find(params[:comment_id])
    if already_liked?
      redirect_to @post
    else
      if @comment.likes.create!(author: current_user)
        redirect_to @post
      else
        respond_to do |format|
          format.html { redirect_to @post, alert: 'You have already voted' }
        end
      end
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def already_liked?
    Like.where(author_id: current_user.id, comment_id:
        params[:comment_id]).exists?
  end


end
