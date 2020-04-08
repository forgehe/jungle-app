require 'rails_helper'

RSpec.feature "Visitor navigates to home page, and registers a new account and logs in", type: :feature, js: true do

  # SETUP
  before :each do
  end

  scenario "Homepage => Login Page => Register" do
    # ACT
    visit root_path
    find('ul.navbar-right').click_on 'Signup'

    sleep(0.5)
    fill_in 'First Name', with: 'John'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'JohnSmith@JohnSmith.com'
    fill_in 'Password', with: 'JohnSmith'
    fill_in 'Enter Your Password Again', with: 'JohnSmith'
    within("form") {
      click_button
    }
      # DEBUG 
    sleep(1)
    save_screenshot

    # VERIFY
    within('.navbar-right') {
      expect(page).to have_text 'Signed in as John'
      expect(page).to have_link 'Logout'
    }
  end

end