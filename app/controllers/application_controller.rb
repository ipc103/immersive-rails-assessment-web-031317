class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?

  private

  def logged_in?
    session[:user_id].present?
  end

  def authorize_user
    unless logged_in?
      flash[:notice] = 'You must be logged in to view this page'
      redirect_to login_path
    end
  end
end
