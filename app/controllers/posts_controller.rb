class PostsController < ApplicationController
  # Devise
  before_action :authenticate_user!, except: %i[index show]
  # impressionist
  impressionist actions: [:show]

  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def show
    # impressionist
    impressionist(@post)
  end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    # check signed
    if user_signed_in?

      @post = Post.new(post_params)

      respond_to do |format|
        if @post.save
          format.html { redirect_to @post, notice: 'Post was successfully created.' }
          format.json { render :show, status: :created, location: @post }
        else
          format.html { render :new }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end

    else
      respond_to do |format|
        format.html { redirect_to posts_url, alert: 'You should log in or sing up' }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # only for 'admin = true' allowed
    if current_user.admin == true
      @post.destroy

      respond_to do |format|
        format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to posts_url, notice: 'Only for admins allowed' }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :content, :author_id, :picture)
  end
end
