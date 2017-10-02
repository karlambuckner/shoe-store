require "capybara/rspec"
require "./app"
require "pry"
require('spec_helper')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'the store creation path', {:type => :feature} do
  it 'allows user to add a new store and capitalizes the store name' do
    visit('/')
    fill_in('store_name', :with => 'converse')
    click_button('Add Store')
    expect(page).to have_content('Converse')
  end

  it 'allows user to add a new brand and capitalizes the brand name' do
    visit('/')
    fill_in('brand_name', :with => 'new balance')
    fill_in('price', :with => '6')
    click_button('Add')
    expect(page).to have_content('New Balance')
  end
end
