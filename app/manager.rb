require 'sinatra/base'
require_relative '../lib/bookmark'

class Manager < Sinatra::Base

  get '/' do
    Bookmark.wipe
    @bookmarks = Bookmark.all
    p @bookmarks
    erb(:index)
  end

  run! if app_file == $0
end