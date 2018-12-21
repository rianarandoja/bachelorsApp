# frozen_string_literal: true

class AdminController < ApplicationController

  skip_before_action :authorize
  layout 'admin_application'

  def index
    @user = User.find_by(id: session[:user_id])
  end

end
