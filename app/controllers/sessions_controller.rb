class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    u = User.new(get_value_from_form)
    user = User.where(email: u.email).where(password: u.password)

    if user.empty?
      session[:user_id] = nil
      redirect_to sessions_new_path

    else
      flash[:status_ok] = 'You were successfully registered'
      session[:user_id] = user.ids
      puts session[:user_id].to_s.concat('user != nill')
      redirect_to posts_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to sessions_new_path
  end



  def save_locale
    session[:locale] = params[:locale]
  end

  private
  def get_value_from_form
    params.require(:user).permit(:email,:password)
  end
end
