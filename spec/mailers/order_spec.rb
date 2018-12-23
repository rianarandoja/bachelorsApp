# frozen_string_literal: true

RSpec.describe OrderMailer, type: :mailer do
  let!(:cart) { create(:cart) }
  let!(:order) { create(:order) }
  let!(:line_item) { create(:line_item, order: order, cart: cart) }
  let!(:line_item2) { create(:line_item, order: order, cart: cart) }

  describe 'received' do
    let(:mail) { OrderMailer.received(order) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Order received')
      expect(mail.to).to eq([order.email])
      expect(mail.from).to eq('ST Online Store smallstonlinestore@gmail.com')
    end

    it 'renders the body' do
      expect(mail.body.encoded).to have_content("Your order number ##{order.id} has been received")
      expect(mail.body.encoded).to have_content(order.name)
      expect(mail.body.encoded).to have_content(line_item.total_price)
      expect(mail.body.encoded).to have_content(line_item2.product_title)
      expect(mail.body.encoded).to have_content(order.summa)
    end
  end
end
