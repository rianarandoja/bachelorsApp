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
    if @product.save
      redirect_to products_url
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    message = if @product.destroy
                'Product was successfully destroyed.'
              else
                'Product could not be deleted, because is added to cart.'
              end

    redirect_to products_url, notice: message
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :image_url, :price, :prod_type)
  end

end
