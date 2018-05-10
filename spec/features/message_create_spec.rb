require 'rails_helper'
feature "Creates a message" do
  before(:each) do 
    visit '/messages'
  end
  scenario "routes to same page if message created" do
    fill_in "message_post", with: "this should pass the test"
    click_button "Post a Message"
    expect(page).to have_content("this should pass the test")
    expect(page).to have_current_path('/messages')
  end
  scenario "if message post is too short" do
    fill_in "message_post", with: "short"
    click_button "Post a Message"
    expect(page).to have_content("Post is too short")
  end
  scenario "log out button should exist on page" do
    expect(page).to have_button('Log Out')
  end
  scenario "routes to user/new if log out is clicked" do
    fill_in "message_post", with: "this should pass the test"
    click_button "Log Out"
    expect(page).to have_current_path('/users/new')
  end
end