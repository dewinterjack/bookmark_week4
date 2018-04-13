require 'pg'
require_relative './bookmark'

class Manager 
  if ENV["RACK_ENV"] == "test" then
    DataMapper.setup(:default, 'postgres://localhost/bookmark_manager_test')
  else
    DataMapper.setup(:default, 'postgres://localhost/bookmark_manager')
  end

  def self.all
    Bookmark.all
  end

  def self.add(fields)
    Bookmark.create(fields)
  end

  def self.delete(id)
    id.each do | id |
      Bookmark.get(id).destroy
    end
    
  end




  # attr_reader :conn

  # @@bookmarks = Array.new

  # def self.all
  #   if ENV["RACK_ENV"] == "test" then
  #     @@conn = PG.connect(dbname: 'bookmark_manager_test')
  #   else
  #     @@conn = PG.connect(dbname: 'bookmark_manager')
  #   end

  #   @@conn.exec("SELECT * FROM bookmarks") do | result |
  #     result.each do | row |
  #       @@bookmarks << Bookmark.new(row.values_at('url').join, row.values_at('title').join)
  #     end
  #   end
  #   @@bookmarks
  # end 

  # def self.add(url, title)
  #   @@conn.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}')")
  #   Bookmark.new(url,title)
  # end

  # def self.delete(bookmarks)
  #   query = "DELETE FROM bookmarks WHERE url = '#{bookmarks[0]}'"
  #   if bookmarks.length > 1 then
  #     bookmarks.each_with_index do |bookmark, index|
  #       if index > 0
  #         query += " OR url = '#{bookmark}'"
  #       end
  #     end
  #   end
  #     @@conn.exec(query)
  # end

  # def self.wipe
  #   @@bookmarks.clear
  # end
end