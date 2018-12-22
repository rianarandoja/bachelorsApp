# frozen_string_literal: true

class SendOrderEmailJob < ApplicationJob

  queue_as :default

  def perform(order)
    @order = order
    OrderMailer.received(@order).deliver_later
  end

end
