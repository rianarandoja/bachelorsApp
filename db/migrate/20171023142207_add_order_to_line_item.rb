# frozen_string_literal: true

class AddOrderToLineItem < ActiveRecord::Migration[5.0]

  def change
    add_reference :line_items, :order, foreign_key: true
  end

end
