require 'rails_helper'

RSpec.feature "Visitor navigates to home page, and clicks on a product to view details", type: :feature, js: true do

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

  scenario "They see all products, then product details" do
    # ACT
    visit root_path
    within('.navbar-right') {
      expect(page).to have_text 'My Cart (0)'
    }
    first('article').click_on 'Add'
    sleep(1)
    # DEBUG 
    save_screenshot

    # VERIFY
    within('.navbar-right') {
      expect(page).to have_text 'My Cart (1)'
    }
  end

end
