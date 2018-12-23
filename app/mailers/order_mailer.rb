# frozen_string_literal: true

class OrderMailer < ApplicationMailer

  default from: "ST Online Store #{ENV['gmail_username']}"

  def received(order)
    @order = order
    order.generate_attachment
    title = order.attachment_title
    attachments[title] = File.read(Rails.root.join('pdf', title))
    mail to: order.email, subject: 'Order received'
  end

end
