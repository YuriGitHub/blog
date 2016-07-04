class RegistrationsController < ApplicationController


  def new
    @user = User.new
  end

  def create
    user = User.create(get_parameters_from_form)
    flash[:status_ok] = 'You were successfully registered'

    redirect_to sessions_new_path
  end

  def update
    @current_user.update(get_parameters_from_edit_form)
    redirect_to posts_path
  end

  def edit

  end

  def stat
    @stat = User.find_by(id: params[:user_id])

    render json: {stat: @stat}

    # if @stat.nil?
    #     @stat = User.new
    # end
  end
  private
  def get_parameters_from_form
    params.require(:user).permit(:first_name, :last_name, :email, :password, :country, :city)
  end

  private
  def get_parameters_from_edit_form
    params.require(:user).permit(:first_name, :last_name, :email, :age, :country, :city, :password, :gender)
  end




end
