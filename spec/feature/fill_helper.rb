require 'pg'

def fill_data
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("INSERT INTO bookmarks (url) VALUES('http://makersacademy.com');")
  connection.exec("INSERT INTO bookmarks (url) VALUES('http://destroyallsoftware.com');")
  connection.exec("INSERT INTO bookmarks (url) VALUES('http://google.com');")
end