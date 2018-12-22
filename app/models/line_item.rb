# frozen_string_literal: true

class LineItem < ApplicationRecord

  belongs_to :order, optional: true
  belongs_to :product, optional: true
  belongs_to :cart

  delegate :title, to: :product, prefix: true

  def total_price
    product.price * quantity
  end

end
