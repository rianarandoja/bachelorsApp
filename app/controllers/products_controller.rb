# frozen_string_literal: true

class ProductsController < ApplicationController

  before_action :set_product, only: %i[show edit update destroy]
  skip_before_action :authorize, only: :one
  layout 'admin_application', except: :one

  include CurrentCart
  before_action :set_cart

  def index
    @products = Product.all
  end

  def show
  end

  def one
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_url }
        format.js
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def who_bought
    @product = Product.find(params[:id])
    @latest_order = @product.orders.order(:updated_at).last
    if stale?(@latest_order)
      respond_to do |format|
        format.atom
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }

      # @products = Product.all
      # ActionCable.server.broadcast 'products',
      # html: render_to_string('store/index', layout: false)
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    message = if @product.destroy
                'Product was successfully destroyed.'
              else
                'Product could not be deleted, because is added to cart.'
              end

    respond_to do |format|
      format.html { redirect_to products_url, notice: message }
      format.json { head :no_content }
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :image_url, :price, :prod_type)
  end

end
