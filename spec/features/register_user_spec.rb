require 'rails_helper'
feature "User creates an account" do
  before(:each) do 
    visit '/users/new'
  end
  scenario "successfully creates a new user account" do
    fill_in "user_first_name", with: "john"
    fill_in "user_last_name", with: "johnnnnny"
    fill_in "user_email", with: "schang@codingdojo.com"
    fill_in "user_username", with: "iamusername"
    click_button "Create User"
    expect(page).to have_current_path(message_path(User.last))    
    expect(page).to have_content("Welcome, john")    
  end
  scenario "unsuccessfully creates a new user account" do 
    click_button "Create User"
    expect(page).to have_current_path(new_user_path)
  end
  scenario "doesn't fill out first name field" do 
    fill_in "user_last_name", with: "shane"
    fill_in "user_email", with: "schang@codingdojo.com"
    click_button "Create User"
    expect(page).to have_content "First name can't be blank"
  end
  scenario "doesn't fill out last name field" do 
    fill_in "user_first_name", with: "shane"
    fill_in "user_email", with: "schang@codingdojo.com"
    click_button "Create User"
    expect(page).to have_content "Last name can't be blank"
  end
  scenario "doesn't fill out email field" do 
    fill_in "user_first_name", with: "shane"
    fill_in "user_last_name", with: "schang"
    click_button "Create User"
    expect(page).to have_content "Email can't be blank"
  end
end
