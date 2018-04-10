require 'pg'
require_relative './fill_helper'

feature 'User enters site' do
  scenario 'can see all bookmarks' do
    fill_data
    visit("/")

    expect(page).to have_content "http://makersacademy.com"
    expect(page).to have_content "http://destroyallsoftware.com"
    expect(page).to have_content "http://google.com"
  end
end
feature 'User can add a bookmark' do
  scenario 'by filling in a url and hitting submit' do
    fill_data
    visit("/")
    fill_in 'new_bookmark', with: 'https://bbc.co.uk' 
    click_button('Add Bookmark')
    expect(page).to have_content "https://bbc.co.uk"
  end
  scenario 'hitting submit without filling in a url' do
    fill_data
    visit("/")
    click_button('Add Bookmark')
    expect(page).to have_content "No url inputted."
  end
end
