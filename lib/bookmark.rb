require 'data_mapper'

class Bookmark
  include DataMapper::Resource
  
  attr_reader :url, :title

  property :id, Serial
  property :title, String
  property :url, String

  def initialize(url, title)
    @url = url
    @title = title
  end

  
end
