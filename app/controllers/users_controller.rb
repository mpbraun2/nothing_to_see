class UsersController < ApplicationController
  def index
  end
  
  def signin
  end

  def create
    user = User.new(registration_params)
    if user.save
      redirect_to '/shoes'
    else 
      flash[:errors] = user.errors.full_messages
    end
  end

  def authenticate
    user = User.find_by(email: login_params[:email])
    if user.nil?
      flash[:errors] = ['User not found']
      redirect_to '/'
    elsif user.authenticate(login_params[:password])
      session[:user_id] = user.id
      redirect_to '/shoes'
    else
      flash[:errors] = ['Incorrect Password']
      redirect_to '/'
    end
  end

  def signout
    reset_session
    redirect_to '/'
  end

private

  def registration_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def login_params
    params.require(:user).permit(:email, :password)
  end
end

