class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  before_action :unloged
  before_action :banned?
  before_action :confirmed?, except: :show

  def current_user
    if session[:author_id]
      @current_user ||= Author.find(session[:author_id])
    else
      @current_user = nil
    end
  end

  # checking logged or not
  def require_login
    redirect_to login_path unless logged_in?
  end

  def login_in(author)
    session[:author_id] = author.id
  end

  def logged_in?
    !current_user.nil?
  end

  # offer to sing up/log in
  def unloged
    cookies[:actions] = if cookies[:actions]
                          cookies[:actions].to_i + 1
                        else
                          0
                        end
  end

  # check banned or not
  def banned?
    flash[:alert] = 'Your are not allowed to create comments or posts. (banned)' if current_user&.banned?
  end

  # check confirmed or not
  def confirmed?
    flash[:alert] = 'Check your email to confirm yourself.(You are not allowed to create posts)' unless current_user&.email_confirmed?
  end
end
