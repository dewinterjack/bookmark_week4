class Bookmark 
  @@bookmarks = Array.new
  def initialize(url)
    add(url)
  end

  def self.all
    @@bookmarks
  end 
  def add(item)
    @@bookmarks << item
  end
end