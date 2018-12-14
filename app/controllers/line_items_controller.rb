class LineItemsController < ApplicationController
  skip_before_action :authorize, only: [:create, :decrease, :increase, :destroy]

  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  def index
    @line_items = LineItem.all
  end

  def show
  end

  def new
    @line_item = LineItem.new
  end

  def edit
  end

  def decrease
    @cart = Cart.find(session[:cart_id])
    @line_item = @cart.decrease(params[:id])

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to store_path, notice: 'Line item was successfully updated.' }
        format.js   { @current_item = @line_item }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def increase
    @cart = Cart.find(session[:cart_id])
    @line_item = @cart.increase(params[:id])

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to store_path, notice: 'Line item was successfully updated.' }
        format.js   { @current_item = @line_item }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to store_index_url }
        format.js   { @current_item = @line_item }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to store_home_url, notice: 'Item successfully deleted from cart.' }
      format.json { head :no_content }
    end
  end

  private

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def line_item_params
    params.require(:line_item).permit(:product_id)
  end
end
