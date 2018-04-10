require 'sinatra/base'
require_relative '../lib/bookmark'

class Manager < Sinatra::Base
  get '/' do
    @bookmarks = Bookmark.all
    erb(:index)
  end

  run! if app_file == $0
end