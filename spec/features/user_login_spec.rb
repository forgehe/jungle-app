require 'rails_helper'

RSpec.feature "Visitor navigates to home page, and registers a new account and logs in", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Homepage => Login Page => Register" do
    # ACT
    visit root_path
    sleep(1)
    # DEBUG 
    save_screenshot

    # VERIFY
  end

end