# frozen_string_literal: true

RSpec.describe 'Orders', type: :feature do
  let!(:user) { create(:user) }
  let!(:cart) { create(:cart) }
  let!(:order) { create(:order) }
  let!(:line_item) { create(:line_item, order: order, cart: cart) }
  let!(:line_item2) { create(:line_item, order: order, cart: cart) }

  before do
    login(user)
    click_link('Orders')
  end

  feature 'list orders' do
    it do
      expect(page).to have_content(order.name)
      expect(page).to have_content(order.email)
    end
  end

  feature 'view order' do
    it do
      click_show
      expect(page).to have_content(order.id)
      expect(page).to have_content(line_item.product_title)
      expect(page).to have_content(line_item2.total_price)
      expect(page).to have_content(order.summa)
    end
  end
end
