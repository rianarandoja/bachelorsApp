class StoreController < ApplicationController
  skip_before_action :authorize

  include CurrentCart
  before_action :set_cart
  def index
    # @header = "Store"
    @products = Product.order(:title)
  end

  def home
    @products = Product.order(:title)
  end

  def filterProducts
    @header = params[:sort]
    if @header == 'Other'
      @products = Product.all.select { |product| product.prod_type == 'Sunglasses' || product.prod_type == 'Other'}
    else
      @products = Product.all.select { |product| product.prod_type == @header }
    end
  end

end
