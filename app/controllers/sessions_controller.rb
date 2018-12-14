class SessionsController < ApplicationController
  skip_before_action :authorize
  layout 'admin_application'

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to products_path
    else
      redirect_to login_url, notice: 'Invalid user/password combination'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to admin_url
  end
end
