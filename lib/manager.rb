require 'pg'
require_relative './bookmark'

class Manager 

  attr_reader :conn

  @@bookmarks = Array.new

  def self.all
    if ENV["RACK_ENV"] == "test" then
      @@conn = PG.connect(dbname: 'bookmark_manager_test')
    else
      @@conn = PG.connect(dbname: 'bookmark_manager')
    end

    @@conn.exec("SELECT * FROM bookmarks") do | result |
      result.each do | row |
        @@bookmarks << Bookmark.new(row.values_at('url').join, row.values_at('title').join)
      end
    end
    @@bookmarks
  end 

  def self.add(url, title)
    @@conn.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}')")
    Bookmark.new(url,title)
  end

  def self.wipe
    @@bookmarks.clear
  end
end