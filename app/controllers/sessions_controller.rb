class SessionsController < ApplicationController
  
  before_action :already_login?, except: [:delete]
  
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path, notice: 'You have successfully logged in'
    else
      flash.now[:alert] = 'Email or Password is invalid' 
      render :new
    end
  end

  def delete
    session[:user_id] = nil
    redirect_to root_path, notice: 'You have successfully logged out'
  end
end
