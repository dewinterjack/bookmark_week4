require 'pg'
require_relative '../../lib/bookmark'

def fill_data
  DataMapper.setup(:default, 'postgres://localhost/bookmark_manager_test')
  DataMapper.auto_upgrade!
  test = Hash.new
  test['url'] = 'http://makersacademy.com'
  Bookmark.create(test)
  Bookmark.create(:url => 'http://destroyallsoftware.com')
  Bookmark.create(:url => 'http://google.com')
  DataMapper.auto_upgrade!
end