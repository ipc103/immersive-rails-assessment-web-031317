class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to guests_path
    else
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end
