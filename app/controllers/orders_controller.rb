# frozen_string_literal: true

class OrdersController < ApplicationController

  skip_before_action :authorize, only: %i[new create one]

  include CurrentCart
  before_action :set_cart, only: %i[new create]
  before_action :ensure_cart_isnt_empty, only: :new
  before_action :set_order, only: %i[show edit update destroy]
  layout 'admin_application', only: %i[show index]

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @line_items = @order.line_items

    @sum = 0
    @line_items.each do |item|
      @sum += item.total_price
    end
  end

  def one
    @order = Order.find(params[:id])
    @line_items = @order.line_items

    @sum = 0
    @line_items.each do |item|
      @sum += item.total_price * item.quantity
    end
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)

    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to action: 'one', id: @order.id
    else
      render :new
    end
  end

  def update
    if @order.update(order_params)
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    message = if @order.destroy
                'Order was successfully destroyed.'
              else
                'Order could not be deleted.'
              end

    redirect_to orders_url, notice: message
  end

  private

  def ensure_cart_isnt_empty
    redirect_to store_index_url, notice: 'Your cart is empty' if @cart.line_items.empty?
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:name, :address, :email, :pay_type)
  end

end
