class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    respond_to do |format|
      if @author.save
        format.html { redirect_to login_path, notice: 'Welcome aboard! Check your email to confirm yourself' }
      else
        format.html { render :new }
      end
    end
  end

  # confirm
  def confirm_email
    author = Author.find_by_confirm_token(params[:id])
    respond_to do |format|
      if author
        author.email_activate
        format.html { redirect_to home_path, notice: 'Your email has been confirmed' }
      else
        format.html { redirect_to home_path, notice: 'Sorry. User does not exist' }
      end
    end
  end

  private

  def author_params
    params.require(:author).permit(:email, :password, :password_confirmation, :first_name, :last_name, :birthday, :gender)
  end
end
