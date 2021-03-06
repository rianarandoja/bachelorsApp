# frozen_string_literal: true

class Order < ApplicationRecord

  has_many :line_items, dependent: :destroy

  enum pay_type: {
    'Check' => 0,
    'Credit card' => 1,
    'Purchase order' => 2
  }

  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: pay_types.keys

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def summa
    line_items.map(&:total_price).map(&:to_f).reduce(:+)
  end

  def pdf_generator
    PdfGenerator.new(order: self)
  end

  def generate_attachment
    pdf_generator.perform
  end

  def attachment_title
    "Order_#{id}.pdf"
  end

end
