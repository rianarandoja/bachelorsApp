# frozen_string_literal: true

FactoryBot.define do
  factory :line_item do
    product
    order
    cart
    quantity { 1 }
  end
end
