# frozen_string_literal: true

class PdfGenerator

  include ActiveModel::Model

  attr_accessor :order

  def perform
    title = order.attachment_title
    save_path = Rails.root.join('pdf', title)

    html = ApplicationController.render(
      'orders/pdf/received_pdf',
      assigns: { order: order }
    )

    pdf = WickedPdf.new.pdf_from_string(html, encoding: 'utf8')

    File.open(save_path, 'wb') do |file|
      file << pdf
    end
  end

end
