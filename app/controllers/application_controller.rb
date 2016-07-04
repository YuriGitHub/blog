class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_user
  before_action :set_locale
  # before_filter :authenticate, except: :new

  private
  def set_user
    unless session[:user_id].nil?
      @current_user = User.find(session[:user_id])[0]
    end

  end

private
  def authenticate
    if session[:user_id].nil?
      redirect_to '/sessions/new/'
    end
  end


  def set_locale
    I18n.locale = session[:locale]
  end



end
