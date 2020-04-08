require 'rails_helper'

RSpec.feature "Visitor navigates to home page, and registers a new account and logs in", type: :feature, js: true do

  # SETUP
  before :each do
  end

  scenario "Homepage => Login Page => Register" do
    # ACT
    visit root_path
    find('ul.navbar-right').click_on 'Signup'

    sleep(1)
    # DEBUG 
    save_screenshot

    # VERIFY
  end

end