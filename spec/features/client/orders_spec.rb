# frozen_string_literal: true

RSpec.describe 'Orders', type: :feature do
  let!(:product) { create(:product, title: 'Shoes') }

  before do
    visit '/'
  end

  feature 'create order' do
    it do
      within("##{product.title}_entry") { click_button('Add to Cart') }
      expect(page).to have_content('Your Cart')
      click_button('Checkout')
      fill_in('Name', with: 'SomeName')
      fill_in('Address', with: 'SomeAddress')
      fill_in('Email', with: 'test@test.ee')
      find('#order_pay_type').find(:option, Order.pay_types.keys.sample).select_option
      click_button('Place Order')
      expect(page).to have_content('Thank you for your order!')
      expect(page).to have_content('SomeAddress')
      expect(page).to have_content(product.title)
    end
  end
end
