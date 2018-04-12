require 'data_mapper'
require  'dm-migrations'

class Bookmark
  include DataMapper::Resource

  attr_reader :url, :title

  property :id, Serial
  property :title, String
  property :url, String

end


