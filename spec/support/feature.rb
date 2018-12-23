# frozen_string_literal: true

module CapybaraHelpers
  def click_show
    click_link('Show')
  end

  def click_edit
    click_link('Edit')
  end

  def click_delete
    click_link('Delete')
  end

  def login(user)
    visit '/admin'
    click_link('Login')
    fill_in('Name', with: user.name)
    fill_in('Password', with: user.password)
    click_button('Login')
  end
end

RSpec.configure do |config|
  config.include CapybaraHelpers, type: :feature
end
