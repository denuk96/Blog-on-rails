class PostsController < ApplicationController
  # impressionist gem
  impressionist actions: [:show]

  before_action :require_login, only: %i[create edit update destroy]
  before_action :set_post, only: %i[show edit update destroy]
  before_action :owner, only: %i[edit update destroy]

  def index
    @posts = if params[:search]
               Post.search(params[:search]).order('created_at DESC').paginate(page: params[:page], per_page: 8)
             else
               Post.all.order('created_at DESC').paginate(page: params[:page], per_page: 8)
             end
  end

  def show
    # impressionist gem
    impressionist(@post)
  end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    if (!@current_user.banned?) && (@current_user.email_confirmed?)
      @post = current_user.posts.build(post_params)
      respond_to do |format|
        if @post.save
          format.html { redirect_to @post, notice: 'Post was successfully created.' }
        else
          format.html { render :new }
        end
      end
    else
      redirect_to home_path, notice: 'Aborted. You have no rights'
    end
  end

  def update
    respond_to do |format|
      if @post.update_attributes(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @post.destroy
    redirect_to home_path, notice: 'Post was successfully destroyed.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  # checking owner or not
  def owner
    author = @post.author_id == @current_user.id
    time = Time.now - @post.created_at < 3601
    unbanned = !@current_user.banned?
    if (author && time && unbanned) || (@current_user.admin?)
    else
      redirect_to home_path, alert: 'Rights error'
    end
  end

  def post_params
    params.require(:post).permit(:title, :content, :author_id, :picture)
  end
end