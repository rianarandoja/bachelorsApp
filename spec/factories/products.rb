# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    sequence(:title) { |n| "Product #{n}" }
    description { 'Some Something' }
    price { 22.0 }
    prod_type { 1 }
  end
end
