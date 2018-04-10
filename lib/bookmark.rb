require 'pg'

class Bookmark 
  @@bookmarks = Array.new
  def initialize(url)
    add(url)
  end

  def self.all
    conn = PG.connect(dbname: 'bookmark_manager')
    conn.exec("SELECT * FROM bookmarks") do | result |
      result.each do | row |
        @@bookmarks << row.values_at('url').join
      end
    end
    @@bookmarks
  end 
  def add(item)
    @@bookmarks << item
  end

  def self.example
    Bookmark.new("http://www.google.com")
    Bookmark.new("http://www.makersacademy.com")
    Bookmark.new("http://www.github.com")
    Bookmark.new("http://www.stackoverflow.com")
  end

  def self.wipe
    @@bookmarks.clear
  end
end