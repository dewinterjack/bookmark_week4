feature 'User enters site' do
  scenario 'can see all bookmarks' do
    visit("/")
    expect(page).to have_content "http://google.com"
  end
end