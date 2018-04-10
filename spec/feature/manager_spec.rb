feature 'User enters site' do
  scenario 'can see all bookmarks' do
    visit("/")
    expect(page).to have_content "http://google.com"
  end
end

feature 'User can add a bookmark' do
  scenario 'by filling in a url and hitting submit' do
    visit("/")
    fill_in 'new_bookmark', with: 'https://news.ycombinator.com' 
    expect(page).to have_content "https://news.ycombinator.com"
  end
end