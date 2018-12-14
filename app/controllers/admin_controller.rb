class AdminController < ApplicationController
  skip_before_action :authorize, only: :index
  def index
    render layout: "admin_application"
    # @total_orders = Order.count
    # @username = User.find_by(id: session[:user_id]).name
  end
end
