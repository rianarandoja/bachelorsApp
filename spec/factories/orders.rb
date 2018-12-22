# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    name { 'riana' }
    address { 'Tartu' }
    email { 'rianarandoja@gmail.com' }
    pay_type { 1 }
  end
end
