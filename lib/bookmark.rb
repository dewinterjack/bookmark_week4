class Bookmark
  attr_reader :url, :title

  def initialize(bookmark)
    @url = bookmark.values_at('url').join
    @title = bookmark.values_at('title').join
  end
end