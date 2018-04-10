feature 'User enters site' do
  scenario 'can see all bookmarks' do
    visit("/")
    expect(page).to have_content "Bookmark Project"
  end
end