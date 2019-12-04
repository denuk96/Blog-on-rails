class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        format.html { redirect_to login_path, notice: 'Welcome aboard! Now you can log in!' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def author_params
    params.require(:author).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end
end
