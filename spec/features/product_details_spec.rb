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

  scenario "They see all products" do
    # ACT
    visit root_path
    # click_on "details" .click_on 'Details »'
    # first('article').find('a.pull-right').click
    first('article').click_on 'Details »'
    sleep(1)
    # DEBUG 
    save_screenshot

    # VERIFY
    expect(page).to have_css 'section.products-show', count: 1
    within('section.products-show') {
      expect(page).to have_css 'img.main-img'
      expect(page).to have_css 'article.product-detail'
    }
  end
end
