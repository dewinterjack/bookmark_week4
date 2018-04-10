require 'pg'

class Manager 
  @@bookmarks = Array.new
  def initialize
    
  end

  def self.all
    @conn = PG.connect(dbname: 'bookmark_manager')
    @conn.exec("SELECT * FROM bookmarks") do | result |
      result.each do | row |
        @@bookmarks << row.values_at('url').join
      end
    end
    @@bookmarks
  end 
  def add(bookmark)
    @conn = PG.connect(dbname: 'bookmark_manager')
    @conn.exec("INSERT INTO bookmarks (url) VALUES ('%s')" % bookmark)
  end

  def self.wipe
    @@bookmarks.clear
  end
end