# frozen_string_literal: true

RSpec.describe 'Products', type: :feature do
  let!(:user) { create(:user) }
  let!(:product) { create(:product, title: 'Shoes') }

  before do
    login(user)
    click_link('Products')
  end

  feature 'list products' do
    it do
      expect(page).to have_content('New product')
      expect(page).to have_content(product.title)
      expect(page).to have_content(product.prod_type)
    end
  end

  feature 'view product' do
    it do
      click_link(product.title)
      expect(page).to have_content(product.description)
    end
  end

  feature 'create product' do
    it do
      click_link('New product')
      fill_in('Title', with: 'NewAwesomeProductTitle')
      fill_in('Description', with: 'NewAwesomeProductDescription')
      find('#product_prod_type').find(:option, Product.prod_types.keys.last).select_option
      fill_in('Price', with: '11')
      click_button('Create Product')
      expect(page).not_to have_content('New Product')
      expect(page).to have_content('NewAwesomeProductTitle')
    end
  end

  feature 'update product' do
    it do
      click_edit
      fill_in('Title', with: 'NewTitle')
      click_button('Update Product')
      expect(page).not_to have_content('Editing Product')
      expect(page).to have_content('NewTitle')
    end
  end

  feature 'destroy product' do
    it do
      click_delete
      expect(page).not_to have_content(product.title)
    end
  end
end
