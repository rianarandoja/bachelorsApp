# frozen_string_literal: true

class OrderMailer < ApplicationMailer

  default from: "ST Online Store #{ENV['gmail_username']}"

  def received(order)
    @order = order
    mail to: order.email, subject: 'Order received'
  end

end
