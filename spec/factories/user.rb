# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'foobar' }
    password { 'foobar' }
  end
end
